library;

import 'dart:convert' show json;
import 'dart:io' show File;

import 'package:animate_do/animate_do.dart' show FadeIn, Pulse, Roulette;
import 'package:calendar_date_picker2/calendar_date_picker2.dart'
    show
        CalendarDatePicker2WithActionButtonsConfig,
        showCalendarDatePicker2Dialog;
import 'package:dio/dio.dart' show DioException, DioExceptionType, Response;
import 'package:elegant_notification/elegant_notification.dart'
    show ElegantNotification;
import 'package:elegant_notification/resources/arrays.dart' show AnimationType;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show
        FilteringTextInputFormatter,
        LengthLimitingTextInputFormatter,
        TextInputFormatter;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:gap/gap.dart' show Gap;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;
import 'package:shimmer/shimmer.dart' show Shimmer;

import '../../core/utils/utils.exports.dart'
    show
        AppColor,
        AppConfig,
        AppStyle,
        DateTimeConversion,
        IconPath,
        Regex,
        StrConversion;

//!
part 'data/file_info.dart';
part 'data/models/country_model.dart';
part 'data/models/dependencies_model.dart';
part 'data/models/lookup_model.dart';
part 'data/models/pagination_model.dart';
part 'data/models/service_model.dart';
part 'data/models/user_model.dart';
part 'data/response_parser.dart';
part 'data/response_states.dart';
part 'data/validators.dart';
//?
part 'presentation/cards/service_card.dart';
//?
part 'presentation/components/avatar_component.dart';
part 'presentation/components/failure_component.dart';
part 'presentation/components/icon_title_component.dart';
part 'presentation/components/salary_component.dart';
part 'presentation/components/shimmer_field_component.dart';
part 'presentation/components/validation_error_component.dart';
//?
part 'presentation/dialog/popup_dialog.dart';
//?
part 'presentation/usecases/checkbox.uc.dart';
part 'presentation/usecases/text_field.uc.dart';
//?
part 'presentation/widgets/checkbox_widget.dart';
part 'presentation/widgets/date_picker_widget.dart';
part 'presentation/widgets/drop_down_widget.dart';
part 'presentation/widgets/glowing_scroll_widget.dart';
part 'presentation/widgets/multi_checkbox_widget.dart';
part 'presentation/widgets/multi_radio_button_widget.dart';
part 'presentation/widgets/multi_selection_field_widget.dart';
part 'presentation/widgets/radio_button_widget.dart';
part 'presentation/widgets/shimmer_effect_widget.dart';
part 'presentation/widgets/svg_widget.dart';
part 'presentation/widgets/text_field_widget.dart';
