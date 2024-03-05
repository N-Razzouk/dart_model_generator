import 'package:dart_model_generator/src/extensions/string_extensions.dart';

/// A class that represents an enumeration.
final class Enumeration {
  /// Constructor for [Enumeration].
  Enumeration({
    required this.name,
    required this.description,
    required this.enumValues,
  });

  /// The name of the enumeration.
  final String name;

  /// The description of the enumeration.
  final String description;

  /// The values of the enumeration.
  final List<String> enumValues;

  @override
  String toString() {
    final StringBuffer enumString = StringBuffer()
      ..writeln(description)
      ..writeln('enum ${name.snakeToPascalCase()}Enum {');
    for (final String value in enumValues) {
      enumString
        ..writeln('\t/// $value')
        ..writeln('\t$value,');
    }
    enumString.writeln('}');
    return enumString.toString();
  }
}
