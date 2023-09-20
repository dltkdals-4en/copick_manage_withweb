import 'package:copick_manage_withweb/check_data.dart';
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/login/widgets/login_denine_dialog.dart';
import 'package:copick_manage_withweb/pages/out/home_page.dart';
import 'package:copick_manage_withweb/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/debugMode.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;
    var login = Provider.of<LoginProvider>(context);
    if (!isLoginPass) {
      return Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '관리자 로그인',
                  style: makeTextStyle(18, AppColors.black, 'bold'),
                ),
                NorH,
                TextFormField(
                  controller: login.email,
                  cursorColor: AppColors.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxWidth: size.width / 3,
                      maxHeight: 100,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    focusColor: AppColors.primary,
                    filled: true,
                    fillColor: AppColors.white,
                    labelText: '이메일 주소를 입력해주세요',
                    labelStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력해주세요.';
                    }
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return '잘못된 이메일 형식입니다.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                ),
                SmH,
                TextFormField(
                  controller: login.pw,
                  obscureText: login.pwObscure,
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxWidth: size.width / 3,
                      maxHeight: 100,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    focusColor: AppColors.primary,
                    filled: true,
                    fillColor: AppColors.white,
                    labelText: '비밀번호를 입력해주세요',
                    labelStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: AppColors.primary,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // login.changePwObscure();
                      },
                      icon: const Icon(
                        Icons.remove_red_eye_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    } else {
                      return null;
                    }
                  },
                ),
                NorH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('자동 로그인'),
                    SmW,
                    Checkbox(
                      value: login.authoSignIn,
                      onChanged: (value) async {
                        print('screen : $value');
                        await login.changeAutoSignIn(value!);
                      },
                    ),
                  ],
                ),
                NorH,
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await login
                          .loginWithEmail(login.email.text, login.pw.text)
                          .then((value) {
                        print('screen signIn: ${login.isSignIn}');
                        if (login.isSignIn) {
                          print('success');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => CheckData()),
                              (route) => false);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => LoginDenineDialog(),
                          );
                        }
                      });
                    }
                  },
                  child: Text('관리자 로그인'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return CheckData();
    }
  }
}
