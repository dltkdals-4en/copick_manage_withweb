import 'package:copick_manage_withweb/main.dart';
import 'package:copick_manage_withweb/pages/home/home_page.dart';
import 'package:copick_manage_withweb/pages/loc_manage_page/loc_manage_page.dart';
import 'package:copick_manage_withweb/pages/splash/splash_page.dart';
import 'package:copick_manage_withweb/pages/task_manage_page/task_manage_page.dart';
import 'package:copick_manage_withweb/pages/task_manage_page/widgets/task_add_page.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/root/root_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (context) => RootPage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      case Routes.location:
        return MaterialPageRoute(
          builder: (context) => LocManagePage(),
        );
      case Routes.task:
        return MaterialPageRoute(
          builder: (context) => TaskManagePage(),
        );
      case Routes.taskAdd:
        return MaterialPageRoute(
          builder: (context) => TaskAddPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => MyApp(),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
