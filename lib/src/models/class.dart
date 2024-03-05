import 'package:dart_model_generator/src/extensions/string_extensions.dart';
import 'package:dart_model_generator/src/models/property.dart';

final class Class {
  final String name;
  final String description;
  List<Property> properties = [];

  Class({
    required this.name,
    required this.description,
    required this.properties,
  });

  String _constructorString() {
    StringBuffer constructorString = StringBuffer();
    constructorString.writeln("\t/// Constructor for [$name].");
    constructorString.writeln("\t$name({");
    for (Property property in properties) {
      constructorString.writeln(
          "\t\t${property.isRequired ? "required " : ""}this.${property.name},");
    }
    constructorString.writeln("\t});");
    return constructorString.toString();
  }

  String _jsonMappingString() {
    StringBuffer jsonMappingBuffer = StringBuffer();
    jsonMappingBuffer
        .writeln("\t/// Maps the class from a map of [String, dynamic].");
    jsonMappingBuffer
        .writeln("\tfactory $name.fromJson(Map<String, dynamic> json) =>");
    jsonMappingBuffer.writeln("\t $name(");
    for (Property property in properties) {
      jsonMappingBuffer.writeln(
          "\t\t\t${property.name}: json['${property.name.pascalToSnakeCase()}'] as ${property.type},");
    }
    jsonMappingBuffer.writeln("\t\t);");

    jsonMappingBuffer.writeln();

    jsonMappingBuffer
        .writeln("\t/// Maps the class to a map of [String, dynamic].");
    jsonMappingBuffer
        .writeln("\tMap<String, dynamic> toJson() => <String, dynamic>{");
    for (Property property in properties) {
      jsonMappingBuffer.writeln(
          "\t\t\t'${property.name.pascalToSnakeCase()}': ${property.name},");
    }
    jsonMappingBuffer.writeln("\t};");

    return jsonMappingBuffer.toString();
  }

  String _copyWithString() {
    StringBuffer copyWithBuffer = StringBuffer();
    copyWithBuffer.writeln("\t/// CopyWith method for [$name].");
    copyWithBuffer.writeln("\t$name copyWith({");
    for (Property property in properties) {
      /// If property is required, we should add question mark to the function parameter
      /// If not, it already has the question mark in the type.
      copyWithBuffer.writeln(
          "\t\t${property.type}${property.isRequired ? "?" : ""} ${property.name},");
    }
    copyWithBuffer.writeln("\t}) => $name(");
    for (Property property in properties) {
      copyWithBuffer.writeln(
          "\t\t${property.name}: ${property.name} ?? this.${property.name},");
    }
    copyWithBuffer.writeln("\t);");
    return copyWithBuffer.toString();
  }

  @override
  String toString() {
    StringBuffer classString = StringBuffer();
    classString.writeln(description);
    classString.writeln("class $name {");
    classString.writeln(_constructorString());
    classString.writeln();
    for (Property property in properties) {
      classString.writeln("$property\n");
    }
    classString.writeln(_jsonMappingString());
    classString.writeln(_copyWithString());
    classString.writeln("}");
    return classString.toString();
  }
}
