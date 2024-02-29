import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/location_manage_provider.dart';
import 'package:copick_manage_withweb/provider/auth_provider.dart';
import 'package:copick_manage_withweb/provider/record_provider.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/routes/route_generator.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'isDebug.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<LocationManageProvider>(
          create: (_) => LocationManageProvider(),
        ),
        ChangeNotifierProvider<RecordProvider>(
          create: (_) => RecordProvider(),
        ),
        ChangeNotifierProvider<GetDataProvider>(
          create: (_) => GetDataProvider(),
        ),
        ChangeNotifierProvider<TaskManageProvider>(
          create: (_) => TaskManageProvider(),
        ),
      ],
      child: EasyLocalization(
        path: 'assets/language',
        supportedLocales: const [
          Locale('ko', 'KR'),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'CO:PICK 수거 시스템 관리',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
