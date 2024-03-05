import 'package:dart_model_generator/src/extensions/string_extensions.dart';
import 'package:dart_model_generator/src/models/property.dart';

/// A class that represents a class.
final class Class {
  /// Constructor for [Class].
  Class({
    required this.name,
    required this.description,
    required this.properties,
  });

  /// The name of the class.
  final String name;

  /// The description of the class.
  final String description;

  /// The properties of the class.
  List<Property> properties = <Property>[];

  String _constructorString() {
    final StringBuffer constructorString = StringBuffer()
      ..writeln('\t/// Constructor for [$name].')
      ..writeln('\t$name({');
    for (final Property property in properties) {
      constructorString.writeln(
          "\t\t${property.isRequired ? "required " : ""}this.${property.name},");
    }
    constructorString.writeln('\t});');
    return constructorString.toString();
  }

  String _jsonMappingString() {
    final StringBuffer jsonMappingBuffer = StringBuffer()
      ..writeln('\t/// Maps the class from a map of [String, dynamic].')
      ..writeln('\tfactory $name.fromJson(Map<String, dynamic> json) =>')
      ..writeln('\t $name(');
    for (final Property property in properties) {
      jsonMappingBuffer.writeln(
          "\t\t\t${property.name}: json['${property.name.pascalToSnakeCase()}'] as ${property.type},");
    }
    jsonMappingBuffer
      ..writeln('\t\t);')
      ..writeln()
      ..writeln('\t/// Maps the class to a map of [String, dynamic].')
      ..writeln('\tMap<String, dynamic> toJson() => <String, dynamic>{');
    for (final Property property in properties) {
      jsonMappingBuffer.writeln(
          "\t\t\t'${property.name.pascalToSnakeCase()}': ${property.name},");
    }
    jsonMappingBuffer.writeln('\t};');

    return jsonMappingBuffer.toString();
  }

  String _copyWithString() {
    final StringBuffer copyWithBuffer = StringBuffer()
      ..writeln('\t/// CopyWith method for [$name].')
      ..writeln('\t$name copyWith({');
    for (final Property property in properties) {
      /// If property is required, we should add question mark to the function parameter
      /// If not, it already has the question mark in the type.
      copyWithBuffer.writeln(
          "\t\t${property.type}${property.isRequired ? "?" : ""} ${property.name},");
    }
    copyWithBuffer.writeln('\t}) => $name(');
    for (final Property property in properties) {
      copyWithBuffer.writeln(
          '\t\t${property.name}: ${property.name} ?? this.${property.name},');
    }
    copyWithBuffer.writeln('\t);');
    return copyWithBuffer.toString();
  }

  @override
  String toString() {
    final StringBuffer classString = StringBuffer()
      ..writeln(description)
      ..writeln('class $name {')
      ..writeln(_constructorString())
      ..writeln();
    for (final Property property in properties) {
      classString.writeln('$property\n');
    }
    classString
      ..writeln(_jsonMappingString())
      ..writeln(_copyWithString())
      ..writeln('}');
    return classString.toString();
  }
}
