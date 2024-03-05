import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

Builder exportBuilder(BuilderOptions options) => ExportBuilder();

class ExportBuilder implements Builder {
  static final Glob _allFilesInLib = Glob('lib/models/**');

  static AssetId _allFileOutput(BuildStep buildStep) => AssetId(
        buildStep.inputId.package,
        p.join('lib/models', 'models.dart'),
      );

  @override
  Map<String, List<String>> get buildExtensions => const <String, List<String>>{
        r'$lib$': <String>['models/models.dart'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final List<String> exports = <String>[];

    await for (final AssetId input
        in buildStep.findAssets(_allFilesInLib).where(
              (AssetId asset) =>
                  asset.path.startsWith('lib/models/') &&
                  asset.path.endsWith('.dart'),
            )) {
      exports.add("export '${input.path.split("/").last}';");
    }

    final AssetId output = _allFileOutput(buildStep);
    return buildStep.writeAsString(output, exports.join('\n'));
  }
}
