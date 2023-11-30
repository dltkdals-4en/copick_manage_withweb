import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/manage_provider.dart';
import 'package:copick_manage_withweb/provider/login_provider.dart';
import 'package:copick_manage_withweb/provider/record_provider.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/routes/route_generator.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBH7OPHLLl0rRhkVznXFOu15YV-mgWbk7s",
        authDomain: "ctg-app-80208.firebaseapp.com",
        projectId: "ctg-app-80208",
        storageBucket: "ctg-app-80208.appspot.com",
        messagingSenderId: "529322696116",
        appId: "1:529322696116:web:ae76584e7a20aa8feaa6e1",
        measurementId: "G-41XK5HCY5Q"),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FbHelper>(
          create: (_) => FbHelper(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (_) => TaskProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<ManageProvider>(
          create: (_) => ManageProvider(),
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
