part of '../../home.exports.dart';

//! LDS: Local Data Source
final class HomeLDS {
  static HomeLDS? _instance;
  HomeLDS._();
  static HomeLDS get instance => _instance ??= HomeLDS._();

  Future<List<PackageInfoModel>> fetchPackages() async {
    try {
      // Define the full path to the JSON file
      const fullPath = 'assets/configs/packages_info.json';
      // Load the JSON string from the asset bundle
      final String response = await rootBundle.loadString(fullPath);
      // Decode the JSON string into a list of maps
      final data = await json.decode(response) as List;
      // Create a list of BondInfoModel instances from the decoded data
      return List<PackageInfoModel>.from(
        data.map((model) => PackageInfoModel.fromMap(model)),
      );
    } catch (_) {
      // If an exception occurs, throw an ArgumentError with a custom error message
      throw ArgumentError('Path not exist', 'FixedIncomeLDS.fetchBonds()');
    }
  }
}
