import 'package:flutter/material.dart';

class LoginDenineDialog extends StatelessWidget {
  const LoginDenineDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text('로그인 실패')],
      ),
    );
  }
}
