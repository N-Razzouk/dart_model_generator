String evaluateTypeString(String type) {
  switch (type) {
    case "string":
      return "String";
    case "integer":
      return "int";
    case "number":
      return "double";
    case "boolean":
      return "bool";
    case "array":
      return "List";
    default:
      return type;
  }
}
