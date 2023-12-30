//! imports
import 'dart:convert' show json;

import 'package:animate_do/animate_do.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, Cubit, ReadContext;
import 'package:gap/gap.dart' show SliverGap, Gap;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart'
    show LiquidPullToRefresh;
import 'package:showcaseview/showcaseview.dart' show ShowCaseWidget;

import '../../core/utils/utils.exports.dart'
    show AppColor, AppConfig, AppStyle, BlocStatus, ContextConversion, IconPath;
import '../_shared_feature_/shared_feature.exports.dart'
    show
        FailureComponent,
        FailureResponse,
        GlowingScrollWidget,
        HSSCard,
        IconButtonWidget,
        ResponseState,
        SectionTitleComponent,
        ShimmerEffectWidget,
        ShowcaseComponent,
        SliderWidget,
        StandardCard,
        SuccessResponse,
        SvgWidget;

//! parts
part 'data/datasources/local_data_source.dart';
part 'data/models/package_info_model.dart';
part 'data/repositories/repository.dart';
part 'presentation/cubits/packages_cubit/packages_cubit.dart';
part 'presentation/cubits/packages_cubit/packages_state.dart';
part 'presentation/pages/home_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/header_widget.dart';
part 'presentation/widgets/sections/slider_widget.dart';
