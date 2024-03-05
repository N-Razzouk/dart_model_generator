extension StringExtensions on String {
  String snakeToPascalCase() => split("_")
      .map((String element) => element[0].toUpperCase() + element.substring(1))
      .join("")
      .replaceAll("_", "");

  String snakeToCamelCase() =>
      snakeToPascalCase()[0].toLowerCase() + snakeToPascalCase().substring(1);

  String pascalToSnakeCase() => split(RegExp(r"(?=[A-Z])"))
      .map((String element) => element.toLowerCase())
      .join("_");

  /// only 80 chars per line
  String formatDocumentation() => length > 80
      ? _splitByLength(80)
          .map(
            (String line) => " /// $line",
          )
          .join("\n")
      : "/// $this";

  List<String> _splitByLength(int numberOfChars) {
    List<String> result = [];
    for (int i = 0; i < length; i += numberOfChars) {
      result.add(substring(i, i + length));
    }
    return result;
  }
}
