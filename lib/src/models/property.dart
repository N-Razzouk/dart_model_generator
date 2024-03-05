import 'package:dart_model_generator/src/extensions/string_extensions.dart';

class Property {
  final String name;
  final String type;
  final bool isRequired;
  final String description;

  Property({
    required this.name,
    required this.type,
    required this.isRequired,
    required this.description,
  });

  factory Property.fromJson(
    Map<String, dynamic> json, {
    String? className,
  }) {
    return Property(
      name: json['name'].toString().snakeToCamelCase(),
      type: _TypeEvaluator.evaluate(
        json,
        prefix: className,
      ),
      isRequired: json['required'] ?? false,
      description: json['description'] ?? "///",
    );
  }

  @override
  String toString() {
    return "\t${description.formatDocumentation()}\n"
        "\tfinal $type $name;";
  }
}

abstract class _TypeEvaluator {
  static final Map<String, String> _typeMap = {
    "string": "String",
    "integer": "int",
    "number": "num",
    "double": "double",
    "boolean": "bool",
  };

  static bool _isDartNativeType(String type) =>
      type == "string" ||
      type == "integer" ||
      type == "double" ||
      type == "number" ||
      type == "boolean";

  static String evaluate(
    Map<String, dynamic> json, {
    String? prefix,
  }) =>
      "${_isDartNativeType(json["type"]) ? _typeMap[json["type"]] ?? "dynamic" : switch (json["type"]) {
          "object" =>
            "$prefix${json['name'].toString().snakeToPascalCase()}Model",
          "array" =>
            "List<${json['items']['type'] == "object" ? "$prefix${json["items"]['name'].toString().snakeToPascalCase()}Model" : _typeMap[json['items']['type']]}${json["items"]["required"] ?? false ? "" : "?"}>",
          "enum" => "$prefix${json["name"].toString().snakeToPascalCase()}Enum",
          _ => "dynamic",
        }}${json["required"] ?? false ? "" : "?"}";
}
