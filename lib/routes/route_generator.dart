import 'package:copick_manage_withweb/main.dart';
import 'package:copick_manage_withweb/pages/area_choice/area_choice_page.dart';
import 'package:copick_manage_withweb/pages/home/home_page.dart';
import 'package:copick_manage_withweb/pages/loc_manage_page/loc_manage_page.dart';
import 'package:copick_manage_withweb/pages/login/login_page.dart';
import 'package:copick_manage_withweb/pages/record/record_page/record_page.dart';
import 'package:copick_manage_withweb/pages/splash/splash_page.dart';
import 'package:copick_manage_withweb/pages/task_add_page/task_add_page.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/root/root_page.dart';
import '../pages/task_manage_page/task_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (context) => const RootPage(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case Routes.location:
        return MaterialPageRoute(
          builder: (context) => const LocManagePage(),
        );

      case Routes.taskAdd:
        return MaterialPageRoute(
          builder: (context) => const TaskAddPage(),
        );
      case Routes.record:
        return MaterialPageRoute(
          builder: (context) => const RecordPage(),
        );
      case Routes.areaChoice:
        return MaterialPageRoute(
          builder: (context) => const AreaChoicePage(),
        );
      case Routes.task:
        return MaterialPageRoute(
          builder: (context) => const TaskPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MyApp(),
        );

    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
