library;

import 'dart:convert' show json;

import 'package:animate_do/animate_do.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocProvider, ReadContext, WatchContext;
import 'package:gap/gap.dart' show Gap;

import '../../../core/router/router.exports.dart' show RouteName;
import '../../../core/services/services.exports.dart' show ApiClient;
import '../../../core/utils/utils.exports.dart'
    show AppColor, AppStyle, BlocStatus, IconPath;
import '../../_shared_feature_/shared_feature.exports.dart'
    show
        APIErrorResponse,
        APIResponseParser,
        CheckboxUC,
        FailureResponse,
        GlowingScrollWidget,
        PopupDialog,
        ResponseState,
        SuccessResponse,
        SvgWidget,
        TextFieldUC,
        UserModel,
        ValidationErrorComponent;
import '../../entry_point/entry_point.exports.dart';
import 'presentation/blocs/login_bloc/login_bloc.dart';

//! parts
part 'data/datasources/remote_datasource.dart';
part 'data/models/login_model.dart';
part 'data/repositories/repository.dart';
//?
part 'presentation/pages/login_page.dart';
//?
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/form_widget.dart';
part 'presentation/widgets/header_widget.dart';
part 'presentation/widgets/register_widget.dart';
part 'presentation/widgets/remember_forget_widget.dart';
