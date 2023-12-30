library;

//! imports
import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart' show Hive;
import 'package:in_app_notification/in_app_notification.dart'
    show InAppNotification;
import 'package:intl/intl.dart' show NumberFormat;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:showcaseview/showcaseview.dart';

import '../../features/fixed_income/fixed_income.exports.dart'
    show FixedIncomePage;
import '../../features/home/home.exports.dart' show HomePage;

//! parts
part 'constants/app_colors.dart';
part 'constants/app_config.dart';
part 'constants/app_styles.dart';
part 'constants/icon_paths.dart';
part 'constants/initializer.dart';
part 'constants/persistent_keys.dart';
part 'enums/bloc_status.dart';
part 'enums/bottom_nav_bar.dart';
part 'extensions/context_conversion.dart';
part 'extensions/double_conversion.dart';
part 'extensions/str_conversion.dart';
part 'theme/app_theme.dart';
part 'theme/buttons_theme.dart';
