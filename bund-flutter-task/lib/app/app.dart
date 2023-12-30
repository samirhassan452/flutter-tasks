import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart'
    show InAppNotification;

import 'core/router/router.exports.dart' show AppRouter, RouteName;
import 'core/utils/utils.exports.dart' show AppTheme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
        title: 'Bünd Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.data,
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
