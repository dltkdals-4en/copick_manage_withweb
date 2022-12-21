
import 'package:copick_manage_withweb/main.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case Routes.root:
      //   return MaterialPageRoute(
      //     builder: (context) => RootPage(),
      //   );
      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (context) => Home(),
      //   );

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
