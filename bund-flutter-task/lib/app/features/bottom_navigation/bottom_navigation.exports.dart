library;

//! imports
import 'package:animations/animations.dart'
    show FadeThroughTransition, PageTransitionSwitcher;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocProvider, Cubit, MultiBlocProvider, ReadContext;
import 'package:gap/gap.dart' show Gap;

import '../../core/utils/utils.exports.dart'
    show AppColor, AppConfig, AppStyle, BottomNavBar;
import '../_shared_feature_/shared_feature.exports.dart'
    show ScrollToCubit, SvgWidget;
import '../fixed_income/fixed_income.exports.dart' show BondsCubit;
import '../home/home.exports.dart' show PackagesCubit;

//! parts
part 'presentation/cubits/nav_bar_cubit.dart';
part 'presentation/pages/bottom_navigation_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/nav_bar_card.dart';
part 'presentation/widgets/nav_bar_structure.dart';
part 'presentation/widgets/nav_bar_widget.dart';
