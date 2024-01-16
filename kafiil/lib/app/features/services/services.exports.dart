library;

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:gap/gap.dart' show Gap;

import '../../core/services/services.exports.dart' show ApiClient;
import '../../core/utils/utils.exports.dart' show AppStyle, BlocStatus;
import '../_shared_feature_/shared_feature.exports.dart'
    show
        APIErrorResponse,
        APIResponseParser,
        FailureComponent,
        FailureResponse,
        GlowingScrollWidget,
        ResponseState,
        ServiceCard,
        ServiceModel,
        ServicesModel,
        ShimmerEffectWidget,
        SuccessResponse;
import 'presentation/cubits/services_cubit/services_cubit.dart';

export 'presentation/cubits/services_cubit/services_cubit.dart';

//! parts
part 'data/datasources/remote_datasource.dart';
part 'data/repositories/repository.dart';
//?
part 'presentation/pages/services_page.dart';
part 'presentation/pages/shimmer_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/popular_services_widget.dart';
part 'presentation/widgets/services_widget.dart';
