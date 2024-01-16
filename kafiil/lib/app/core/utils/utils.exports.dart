library;

import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List;
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:intl/intl.dart' show DateFormat;

import '../../features/countries/countries.exports.dart' show CountriesPage;
import '../../features/entry_point/entry_point.exports.dart';
import '../../features/services/services.exports.dart' show ServicesPage;
import '../../features/who_am_i/who_am_i.exports.dart' show WhoAmIPage;

//! parts
part 'constants/app_colors.dart';
part 'constants/app_config.dart';
part 'constants/app_styles.dart';
part 'constants/icon_paths.dart';
part 'constants/navigator_keys.dart';
part 'constants/persistent_keys.dart';
part 'constants/regex.dart';
//?
part 'enums/bloc_status.dart';
part 'enums/bottom_nav_bar.dart';
part 'enums/register_steps.dart';
//?
part 'extensions/context_conversion.dart';
part 'extensions/str_conversion.dart';
//?
part 'theme/app_bar_theme.dart';
part 'theme/app_theme.dart';
part 'theme/buttons_theme.dart';
part 'theme/input_decoration_theme.dart';
part 'theme/menu_style_theme.dart';
