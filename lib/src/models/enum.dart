import 'package:dart_model_generator/src/extensions/string_extensions.dart';

final class Enumeration {
  Enumeration({
    required this.name,
    required this.enumValues,
  });

  final String name;

  final List<String> enumValues;

  @override
  String toString() {
    StringBuffer enumString = StringBuffer();
    enumString.writeln("enum ${name.snakeToPascalCase()}Enum {");
    for (String value in enumValues) {
      value == enumValues.last
          ? enumString.writeln("\t$value")
          : enumString.writeln("\t$value,");
    }
    enumString.writeln("}");
    return enumString.toString();
  }
}
