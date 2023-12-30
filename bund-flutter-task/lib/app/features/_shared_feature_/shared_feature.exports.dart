library;

//!
import 'dart:async' show Timer;
import 'dart:math' show pow;

import 'package:animate_do/animate_do.dart' show FadeInDown, FadeInLeft, Swing;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, Cubit;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:gap/gap.dart' show Gap;
import 'package:shimmer/shimmer.dart' show Shimmer;
import 'package:showcaseview/showcaseview.dart' show Showcase;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, WormEffect;

import '../../core/utils/utils.exports.dart'
    show
        AppColor,
        AppConfig,
        AppStyle,
        ContextConversion,
        DoubleConversion,
        IconPath,
        StrConversion;

//!
part 'data/response_states.dart';
part 'logic/calculator/investment_calculator.dart';
part 'logic/scroll_to_cubit/scroll_to_cubit.dart';
part 'logic/slider_cubit/slider_cubit.dart';
part 'presentation/buttons/icon_button.dart';
part 'presentation/buttons/scroll_to_button.dart';
part 'presentation/cards/bond_card.dart';
part 'presentation/cards/hss_card.dart';
part 'presentation/cards/notification_card.dart';
part 'presentation/cards/standard_card.dart';
part 'presentation/cards/term_type_card.dart';
part 'presentation/components/failure_component.dart';
part 'presentation/components/section_title_component.dart';
part 'presentation/components/showcase_component.dart';
part 'presentation/components/title_subtitle_component.dart';
part 'presentation/widgets/glowing_scroll_widget.dart';
part 'presentation/widgets/shimmer_effect_widget.dart';
part 'presentation/widgets/slider_widget.dart';
part 'presentation/widgets/svg_widget.dart';
