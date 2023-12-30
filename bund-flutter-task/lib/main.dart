import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/core/utils/utils.exports.dart' show Initializer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Initializer.init();

  runApp(const MyApp());
}
