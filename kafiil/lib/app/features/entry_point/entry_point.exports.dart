library;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/utils/utils.exports.dart' show PersistentKey;
import '../_shared_feature_/shared_feature.exports.dart'
    show FailureResponse, ResponseState, SuccessResponse;
import '../authentication/login/login.exports.dart';

export 'presentation/cubit/entry_point_cubit.dart';

//! parts
part 'data/datasources/local_datasource.dart';
part 'data/repositories/repository.dart';
