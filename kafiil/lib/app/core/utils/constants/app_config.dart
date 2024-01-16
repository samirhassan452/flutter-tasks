part of '../utils.exports.dart';

class AppConfig {
  static const String appFontType = 'Montserrat';
  static const String dateFormat = 'yyyy-MM-dd';

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortDelayDuration = Duration(milliseconds: 500);
  static const Duration longDelayDuration = Duration(milliseconds: 1500);

  static Future<List<int>> fileToBytes(String filePath) async {
    if (filePath.isEmpty) return Future.value(const []);
    final bytes = await File(filePath).readAsBytes();

    // "$bytes".successLog();
    return Future.value(Uint8List.fromList(bytes));
  }

  static bool get isRememberedMe => NavigatorKey.root.currentContext!
      .read<EntryPointCubit>()
      .state
      .isRememberedMe;
  static bool get isAuthenticated => NavigatorKey.root.currentContext!
      .read<EntryPointCubit>()
      .state
      .isAuthenticated;
  static String? get accessToken => NavigatorKey.root.currentContext!
      .read<EntryPointCubit>()
      .state
      .accessToken;
}
