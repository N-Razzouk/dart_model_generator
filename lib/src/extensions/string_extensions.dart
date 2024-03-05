/// Contains extensions for the [String] class.
extension StringExtensions on String {
  /// Converts a string from snake_case to PascalCase.
  String snakeToPascalCase() => split('_')
      .map((String element) => element[0].toUpperCase() + element.substring(1))
      .join()
      .replaceAll('_', '');

  /// Converts a string from snake_case to camelCase.
  String snakeToCamelCase() =>
      snakeToPascalCase()[0].toLowerCase() + snakeToPascalCase().substring(1);

  /// Converts a string from PascalCase to snake_case.
  String pascalToSnakeCase() => split(RegExp(r'(?=[A-Z])'))
      .map((String element) => element.toLowerCase())
      .join('_');

  /// Only 80 chars per line
  String formatDocumentation() => length > 80
      ? _splitByLength(80)
          .map(
            (String line) => ' /// $line',
          )
          .join('\n')
      : '/// $this';

  List<String> _splitByLength(int numberOfChars) {
    final List<String> result = <String>[];
    for (int i = 0; i < length; i += numberOfChars) {
      result.add(substring(i, i + length));
    }
    return result;
  }
}
