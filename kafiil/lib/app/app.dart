import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

import 'core/router/router.exports.dart' show AppRouter, RouteName;
import 'core/utils/utils.exports.dart' show AppTheme, NavigatorKey;
import 'features/entry_point/entry_point.exports.dart' show EntryPointCubit;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntryPointCubit>(
      create: (_) => EntryPointCubit()..onInit(),
      child: MaterialApp(
        key: NavigatorKey.root,
        title: 'Kafiil',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.data,
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
