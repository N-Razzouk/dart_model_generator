import 'dart:async';
import 'dart:convert';
import 'package:build/build.dart';
import 'package:dart_model_generator/src/extensions/string_extensions.dart';
import 'package:dart_model_generator/src/models/class.dart';
import 'package:dart_model_generator/src/models/enum.dart';
import 'package:dart_model_generator/src/models/property.dart';

Builder modelBuilder(BuilderOptions options) => ModelBuilder();

class ModelBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final AssetId inputId = buildStep.inputId;

    final String fileAsString = await buildStep.readAsString(buildStep.inputId);

    final StringBuffer res = StringBuffer();

    final List<Object> objects = _createObjects(
      jsonDecode(fileAsString),
    );

    for (final Object currObject in objects) {
      currObject == objects.last
          ? res.write('$currObject')
          : res.write('$currObject\n');
    }
    await buildStep.writeAsString(
        AssetId(
          inputId.package,
          "lib/models/${inputId.pathSegments.last.replaceFirst(".json", ".model.dart")}",
        ),
        res.toString());
    res.clear();
  }

  @override
  Map<String, List<String>> get buildExtensions => <String, List<String>>{
        '^json/{{}}.json': <String>['lib/models/{{}}.model.dart'],
      };

  List<Object> _createObjects(
    Map<String, dynamic> json, [
    String? parentClass,
  ]) {
    final List<Object> classes = <Object>[]..add(
        _createClass(
          json,
          parentClass: parentClass,
        ),
      );
    for (final Map<String, dynamic> property in json['properties']) {
      if (property['type'] == 'object') {
        classes.addAll(
          _createObjects(
            property,
            (classes.first as Class).name.replaceAll('Model', ''),
          ),
        );
      } else if (property['type'] == 'enum') {
        classes.add(
          _createEnum(
            property,
            parentClass: (classes.first as Class).name.replaceAll('Model', ''),
          ),
        );
      } else if (property['type'] == 'array' &&
          property['items']['type'] == 'object') {
        classes.addAll(
          _createObjects(
            property['items'],
            (classes.first as Class).name.replaceAll('Model', ''),
          ),
        );
      }
    }
    return classes;
  }

  Class _createClass(
    Map<String, dynamic> json, {
    String? parentClass,
  }) =>
      Class(
        name: parentClass != null
            ? "$parentClass${json["name"].toString().snakeToPascalCase()}Model"
            : "${json["name"].toString().snakeToPascalCase()}Model",
        description: json['description'].toString().formatDocumentation(),
        properties: List<Map<String, dynamic>>.from(json['properties'])
            .map(
              (Map<String, dynamic> propertyJson) => Property.fromJson(
                propertyJson,
                className: parentClass != null
                    ? "$parentClass${json["name"].toString().snakeToPascalCase()}"
                    : json['name'].toString().snakeToPascalCase(),
                // : null,
              ),
            )
            .toList(),
      );

  Enumeration _createEnum(
    Map<String, dynamic> json, {
    String? parentClass,
  }) =>
      Enumeration(
        name: "$parentClass${json["name"].toString().snakeToPascalCase()}",
        description: json['description'].toString().formatDocumentation(),
        enumValues: List<String>.from(
          json['items'],
        ),
      );
}
