library;

//! imports
import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:animations/animations.dart'
    show FadeThroughTransition, PageTransitionSwitcher;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocProvider, Cubit, MultiBlocProvider, ReadContext;
import 'package:gap/gap.dart' show Gap;

import '../../core/router/router.exports.dart' show RouteName;
import '../../core/utils/utils.exports.dart'
    show AppColor, AppConfig, AppStyle, BottomNavBar;
import '../_shared_feature_/shared_feature.exports.dart' show SvgWidget;
import '../countries/countries.exports.dart'
    show CountriesBloc, CountriesOnFetch;
import '../entry_point/entry_point.exports.dart' show EntryPointCubit;
import '../services/services.exports.dart' show ServicesCubit;
import '../who_am_i/who_am_i.exports.dart' show WhoAmICubit;

//! parts
part 'presentation/cubits/nav_bar_cubit.dart';
part 'presentation/pages/bottom_navigation_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/header_widget.dart';
part 'presentation/widgets/nav_bar_card.dart';
part 'presentation/widgets/nav_bar_structure.dart';
part 'presentation/widgets/nav_bar_widget.dart';
