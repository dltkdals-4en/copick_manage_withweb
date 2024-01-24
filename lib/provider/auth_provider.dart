import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copick_manage_withweb/data_helper/fb_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool? autoLogin;

  bool authoSignIn = false;
  String? userId;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    var username = usernameController.text;
    var password = passwordController.text;
    print('$username//$password');
    final DocumentSnapshot? userData =
        await FbHelper().getUserInfo(username, password);
    if (userData != null) {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('autoLogin', autoLogin??false);

      return true;
    } else {
      return false;
    }
  }

  void setAutoLogin(bool value) {
    autoLogin = value;
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    print('try autologin');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var i = prefs.getBool('autoLogin');
    print(i);
    return i ?? false;
  }
}
