library;

//! imports
import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry;
import 'package:flutter/services.dart' show rootBundle;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/utils.exports.dart' show AppConfig;

//! parts
part 'global/api_client.dart';
part 'local/initializer.dart';
