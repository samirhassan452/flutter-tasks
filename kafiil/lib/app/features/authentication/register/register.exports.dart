library;

import 'dart:io' show HttpStatus;

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart' show Gap;

import '../../../core/router/router.exports.dart' show RouteName;
import '../../../core/services/services.exports.dart' show ApiClient;
import '../../../core/utils/utils.exports.dart'
    show
        AppColor,
        AppConfig,
        AppStyle,
        BlocStatus,
        RegisterSteps,
        StrConversion;
import '../../_shared_feature_/shared_feature.exports.dart'
    show
        APIErrorResponse,
        APIResponseParser,
        AvatarComponent,
        DependenciesModel,
        DropDownWidget,
        FailureComponent,
        FailureResponse,
        FileInfo,
        GlowingScrollWidget,
        MultiCheckboxWidget,
        MultiRadioButtonWidget,
        MultiSelectionFieldWidget,
        PopupDialog,
        ResponseState,
        SalaryComponent,
        ShimmerEffectWidget,
        ShimmerFieldComponent,
        SuccessResponse,
        TextFieldUC,
        ValidationErrorComponent;
// import 'package:gap/gap.dart' show Gap;

import 'presentation/blocs/register_bloc/register_bloc.dart';
import 'presentation/blocs/step1_bloc/step1_bloc.dart';
import 'presentation/blocs/step2_bloc/step2_bloc.dart';
import 'presentation/blocs/stepper_cubit/stepper_cubit.dart';

//! parts
part 'data/datasources/remote_datasource.dart';
part 'data/models/register_model.dart';
part 'data/repositories/repository.dart';
//?
part 'presentation/pages/register_page.dart';
part 'presentation/pages/shimmer_page.dart';
//?
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/footer_widget.dart';
part 'presentation/widgets/header_widget.dart';
part 'presentation/widgets/step1/step1_body_widget.dart';
part 'presentation/widgets/step2/step2_body_widget.dart';
part 'presentation/widgets/stepper_widget.dart';
part 'presentation/widgets/validation_error_widget.dart';
