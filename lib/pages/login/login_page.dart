import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: authProvider.usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: authProvider.passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: authProvider.autoLogin ?? false,
                  onChanged: (value) {
                    authProvider.setAutoLogin(value!);
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    final bool loginSuccessful = await authProvider.login();

                    if (loginSuccessful) {
                      Navigator.of(context).pushNamed(Routes.areaChoice);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid credentials'),
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
