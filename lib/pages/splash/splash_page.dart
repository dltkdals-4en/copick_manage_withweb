import 'package:copick_manage_withweb/isDebug.dart';
import 'package:copick_manage_withweb/login/login_screen.dart';
import 'package:copick_manage_withweb/pages/area_choice/area_choice_page.dart';
import 'package:copick_manage_withweb/pages/root/root_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_helper/enum_helper.dart';
import '../../provider/get_data_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var server = Provider.of<GetDataProvider>(context);
    // return LoginScreen();
    // return AreaChoicePage();
    if(isDebug){
      server.areaInfo = AreaInfo.Anseong;
      return RootPage();
    }else{
      return AreaChoicePage();
    }

  }
}
