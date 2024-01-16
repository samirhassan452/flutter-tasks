library;

//! imports
import 'package:animate_do/animate_do.dart' show JelloIn;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlay;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;

import '../../core/router/router.exports.dart' show RouteName;
import '../../core/utils/utils.exports.dart'
    show AppColor, BlocStatus, IconPath;
import '../entry_point/entry_point.exports.dart'
    show EntryPointCubit, EntryPointState;

//! parts
part 'presentation/pages/splash_page.dart';
