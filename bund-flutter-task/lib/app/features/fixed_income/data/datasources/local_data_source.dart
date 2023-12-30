part of '../../fixed_income.exports.dart';

//! LDS: Local Data Source
final class FixedIncomeLDS {
  static FixedIncomeLDS? _instance;
  FixedIncomeLDS._();
  static FixedIncomeLDS get instance => _instance ??= FixedIncomeLDS._();

  Future<List<BondInfoModel>> fetchBonds() async {
    try {
      // Define the full path to the JSON file
      const fullPath = 'assets/configs/bonds_info.json';
      // Load the JSON string from the asset bundle
      final String response = await rootBundle.loadString(fullPath);
      // Decode the JSON string into a list of maps
      final data = await json.decode(response) as List;
      // Create a list of BondInfoModel instances from the decoded data
      return List<BondInfoModel>.from(
        data.map((model) => BondInfoModel.fromMap(model)),
      );
    } catch (_) {
      // If an exception occurs, throw an ArgumentError with a custom error message
      throw ArgumentError('Path not exist', 'FixedIncomeLDS.fetchBonds()');
    }
  }

  Future<void> persistInvestmentAmount(double amount) async {
    try {
      // Open a Hive box with the name of the investment box
      var box = await Hive.openBox(PersistentKey.investmentBox);
      // Store the investment amount in the Hive box
      await box.put(PersistentKey.amount, amount);
    } catch (e) {
      // If an exception occurs, throw it with received error
      throw Exception(e);
    }
  }

  Future<void> persistYearTerm(int term) async {
    try {
      // Open a Hive box with the name of the investment box
      var box = await Hive.openBox(PersistentKey.investmentBox);
      // Store the year term in the Hive box
      await box.put(PersistentKey.yearTerm, term);
    } catch (e) {
      // If an exception occurs, throw it with received error
      throw Exception(e);
    }
  }

  Future<double?> fetchInvestmentAmount() async {
    try {
      // Open a Hive box with the name of the investment box
      var box = await Hive.openBox(PersistentKey.investmentBox);
      // Fetch the investment amount from the Hive box
      double? fetchedAmount = box.get(PersistentKey.amount);
      // Return a ResponseState object with the fetched amount
      return Future.value(fetchedAmount);
    } catch (e) {
      // If an exception occurs, throw it with received error
      throw Exception(e);
    }
  }

  Future<int?> fetchYearTerm() async {
    try {
      // Open a Hive box with the name of the investment box
      var box = await Hive.openBox(PersistentKey.investmentBox);
      // Fetch the year term from the Hive box
      int? term = box.get(PersistentKey.yearTerm);
      // Return a ResponseState object with the fetched year term
      return Future.value(term);
    } catch (e) {
      // If an exception occurs, throw it with received error
      throw Exception(e);
    }
  }
}
