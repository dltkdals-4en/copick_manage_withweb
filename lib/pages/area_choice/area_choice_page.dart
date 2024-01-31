import 'package:copick_manage_withweb/data_helper/enum_helper.dart';
import 'package:copick_manage_withweb/pages/root/root_page.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:copick_manage_withweb/utilitys/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AreaChoicePage extends StatelessWidget {
  const AreaChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    var server = Provider.of<GetDataProvider>(context);
    var size = MediaQuery.of(context).size;
    if(server.areaInfo != null){
      return RootPage();
    }else{
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('관리할 지역을 선택해주세요',style: kHeaderTextStyle,),
              kBigH,
              CustomBtn(
                onPressed: () {
                  server.changeArea(AreaInfo.Seongdong);
                  Navigator.pushNamed(context, Routes.root);
                },
                title: '성동',
                size: const Size(150, 50),
              ),
              kNorH,
              CustomBtn(
                onPressed: () {
                  server.changeArea(AreaInfo.Anseong);
                  Navigator.pushNamed(context, Routes.root);
                },
                title: '안성',
                size: const Size(150, 50),
              ),
            ],
          ),
        ),
      );
    }

  }
}
