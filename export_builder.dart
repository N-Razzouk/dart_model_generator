import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

Builder exportBuilder(BuilderOptions options) => ExportBuilder();

class ExportBuilder implements Builder {
  static final _allFilesInLib = Glob('lib/models/**');

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      p.join('lib/models', 'models.dart'),
    );
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ['models/models.dart'],
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final List<String> exports = <String>[];

    await for (final input in buildStep.findAssets(_allFilesInLib).where(
          (AssetId asset) =>
              asset.path.startsWith("lib/models/") &&
              asset.path.endsWith(".dart"),
        )) {
      exports.add("export '${input.path.split("/").last}';");
    }

    final output = _allFileOutput(buildStep);
    return buildStep.writeAsString(output, exports.join('\n'));
  }
}
