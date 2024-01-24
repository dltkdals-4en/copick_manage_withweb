import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../splash/splash_page.dart';
import 'login_page.dart';

class LoginBranch extends StatelessWidget {
  const LoginBranch({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder(
      future: authProvider.tryAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator if auto-login check is in progress
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          if (snapshot.data == true) {
            // If auto-login is successful, navigate to HomePage
            return SplashPage();
          } else {
            // If auto-login is unsuccessful, navigate to LoginPage
            return LoginPage();
          }
        }
      },
    );
  }
}
