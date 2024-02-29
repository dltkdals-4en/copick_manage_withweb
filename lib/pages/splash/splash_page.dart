import 'package:copick_manage_withweb/pages/area_choice/area_choice_page.dart';
import 'package:copick_manage_withweb/pages/root/root_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if(kDebugMode){
      print('debugMode Start');
      return const AreaChoicePage();
    }else{
      return FutureBuilder(
        future: authProvider.tryAutoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a loading indicator if auto-login check is in progress
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.data == true) {
              // If auto-login is successful, navigate to HomePage
              return const AreaChoicePage();
            } else {
              // If auto-login is unsuccessful, navigate to LoginPage
              return const LoginPage();
            }
          }
        },
      );
    }

  }
//   var server = Provider.of<GetDataProvider>(context);
//   // return LoginScreen();
//   // return AreaChoicePage();
//   if(isDebug){
//     server.areaInfo = AreaInfo.Anseong;
//     return const RootPage();
//   }else{
//     return const AreaChoicePage();
//   }
//
// }
}
