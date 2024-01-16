library;

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:gap/gap.dart' show Gap;

import '../../core/services/services.exports.dart' show ApiClient;
import '../../core/utils/utils.exports.dart'
    show AppColor, AppStyle, BlocStatus;
import '../_shared_feature_/shared_feature.exports.dart'
    show
        APIErrorResponse,
        APIResponseParser,
        CountriesModel,
        CountryModel,
        FailureComponent,
        FailureResponse,
        GlowingScrollWidget,
        PaginationParams,
        ResponseState,
        ShimmerEffectWidget,
        SuccessResponse;
import 'presentation/blocs/countries_bloc/countries_bloc.dart';

export 'presentation/blocs/countries_bloc/countries_bloc.dart';

//! parts
part 'data/datasources/remote_datasource.dart';
part 'data/repositories/repository.dart';
//?
part 'presentation/pages/countries_page.dart';
part 'presentation/pages/shimmer_page.dart';
part 'presentation/widgets/body_widget.dart';
part 'presentation/widgets/page_indicators_widget.dart';
part 'presentation/widgets/shimmer_table_widget.dart';
part 'presentation/widgets/table_cols_widget.dart';
part 'presentation/widgets/table_row_widget.dart';
part 'presentation/widgets/table_widget.dart';
