library;

//! imports
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:gap/gap.dart' show Gap;

import '../../core/services/services.exports.dart' show ApiClient;
import '../../core/utils/utils.exports.dart' show BlocStatus, StrConversion;
import '../_shared_feature_/shared_feature.exports.dart'
    show
        APIErrorResponse,
        APIResponseParser,
        AvatarComponent,
        DependenciesModel,
        FailureComponent,
        FailureResponse,
        GlowingScrollWidget,
        MultiCheckboxWidget,
        MultiRadioButtonWidget,
        MultiSelectionFieldWidget,
        ResponseState,
        SalaryComponent,
        ShimmerEffectWidget,
        ShimmerFieldComponent,
        SuccessResponse,
        TextFieldUC,
        UserModel;
import 'presentation/cubits/who_am_i_cubit/who_am_i_cubit.dart';

export 'presentation/cubits/who_am_i_cubit/who_am_i_cubit.dart';

//! parts
part 'data/datasources/remote_datasource.dart';
part 'data/repositories/repository.dart';
//?
part 'presentation/pages/shimmer_page.dart';
part 'presentation/pages/who_am_i_page.dart';
part 'presentation/widgets/body_widget.dart';
