import 'package:copick_manage_withweb/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    if(login.isSignIn== false){
        login.autoLogin();
        return Center(child: CircularProgressIndicator());
    }
    return Container();
  }
}
