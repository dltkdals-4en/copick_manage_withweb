import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool authoSignIn = false;
  bool isSignIn = false;
  TextEditingController email = TextEditingController();
  String emailId = '';
  TextEditingController pw = TextEditingController();
  bool pwObscure = true;
  List<String>? loginInfo;

  Future<void> loginWithEmail(String email, String pw) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
     await _auth
          .signInWithEmailAndPassword(email: email, password: pw)
          .then((value) async {
        if (authoSignIn == true) {
          await prefs.setStringList('loginInfo', [email, pw]);
        }
        isSignIn = true;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('firebase : $e');
      }
      notifyListeners();
    } catch (e) {
      print('catch $e');
      notifyListeners();
    }
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginInfo = prefs.getStringList('loginInfo');

    notifyListeners();
    if (loginInfo!.isEmpty) {}
  }

  Future<void> changeAutoSignIn(bool value) async {
    print('provider : $value');
    authoSignIn = value;
    notifyListeners();
  }
}
