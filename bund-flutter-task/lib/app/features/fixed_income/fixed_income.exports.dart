library;

//! imports
import 'dart:async' show FutureOr;
import 'dart:convert' show json;

import 'package:animate_do/animate_do.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show HapticFeedback, SystemSound, SystemSoundType, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocProvider, Cubit, ReadContext, WatchContext;
import 'package:gap/gap.dart' show Gap, SliverGap;
import 'package:hive/hive.dart' show Hive;
import 'package:in_app_notification/in_app_notification.dart'
    show InAppNotification;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart'
    show LiquidPullToRefresh;

import '../../core/services/services.exports.dart';
import '../../core/utils/utils.exports.dart'
    show
        AppColor,
        AppConfig,
        AppStyle,
        BlocStatus,
        ContextConversion,
        DoubleConversion,
        IconPath,
        PersistentKey;
import '../_shared_feature_/shared_feature.exports.dart'
    show
        BondCard,
        Calculator,
        FailureComponent,
        FailureResponse,
        GlowingScrollWidget,
        IconButtonWidget,
        NotificationCard,
        ResponseState,
        ScrollToButton,
        ScrollToCubit,
        SectionTitleComponent,
        ShimmerEffectWidget,
        SuccessResponse,
        SvgWidget,
        TermTypeCard,
        TitleSubtitleComponent;

//! parts
part 'data/datasources/local_data_source.dart';
part 'data/models/bond_info_model.dart';
part 'data/repositories/repository.dart';
part 'presentation/cubits/bonds_cubit/bonds_cubit.dart';
part 'presentation/cubits/bonds_cubit/bonds_state.dart';
part 'presentation/cubits/investment_amount_cubit/investment_amount_cubit.dart';
part 'presentation/cubits/investment_amount_cubit/investment_amount_state.dart';
part 'presentation/pages/fixed_income_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/fab_buttons.dart';
part 'presentation/widgets/header_widget.dart';
part 'presentation/widgets/sections/button_widget.dart';
part 'presentation/widgets/sections/calculator/amount_widget.dart';
part 'presentation/widgets/sections/calculator/calculations_widget.dart';
part 'presentation/widgets/sections/calculator/year_terms_widget.dart';
part 'presentation/widgets/sections/investment_calculator_widget.dart';
part 'presentation/widgets/sections/portfolio_widget.dart';
part 'presentation/widgets/sections/ytm_widget.dart';
