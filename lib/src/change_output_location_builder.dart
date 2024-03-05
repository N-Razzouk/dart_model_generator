import 'package:build/build.dart';

Builder changeOutputLocationBuilder(BuilderOptions options) =>
    ChangeOutputLocationBuilder();

class ChangeOutputLocationBuilder extends Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        "lib/input/{{}}.dart": ['lib/generated/{{}}.copy'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    print("reaching here");
    print(buildStep.inputId.pathSegments.last.replaceFirst(".dart", ".copy"));
    final String fileContent = await buildStep.readAsString(buildStep.inputId);
    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package,
          "lib/generated/${buildStep.inputId.pathSegments.last.replaceFirst(".dart", ".copy")}"),
      // buildStep.inputId.changeExtension(".copy"),
      "THIS IS A BIG FAT COPY! \n\n\n$fileContent",
    );
  }
}
