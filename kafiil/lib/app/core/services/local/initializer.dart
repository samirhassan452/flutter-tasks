part of '../services.exports.dart';

final class Initializer {
  static Future<void> init() async {
    /// The fonts on [fonts.google.com] include license files for each font.
    /// For example, the Lato font comes with an OFL.txt file.
    ///
    /// Once you've decided on the fonts you want in your published app,
    /// you should add the appropriate licenses to your flutter app's LicenseRegistry.
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }
}
