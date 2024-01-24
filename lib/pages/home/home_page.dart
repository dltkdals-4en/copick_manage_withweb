import 'package:copick_manage_withweb/pages/home/widgets/home_task_add_widget.dart';
import 'package:copick_manage_withweb/pages/home/widgets/home_task_check_widget.dart';
import 'package:copick_manage_withweb/pages/record/record_page/record_page.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:copick_manage_withweb/utilitys/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var dataProvider = Provider.of<GetDataProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${tmProvider.selectedArea!.title} 지역 정보 관리',
          style: kAppbarTitle.copyWith(),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            dataProvider.init();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: KColors.lightPrimary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('총 매장 개수 : ${tmProvider.wasteList!.length}'),
                      kNorH,
                      CustomBtn(
                        onPressed: () {
                          tmProvider.changeLocList(null);
                          Navigator.pushNamed(context, Routes.location);
                        },
                        title: '매장 관리',
                        size: const Size(100, 50),
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
              kBigH,
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: KColors.lightPrimary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '태스크 관리',
                        style: kHeaderTextStyle.copyWith(),
                      ),
                      kBigH,
                      const HomeTaskAddWidget(),
                      kBigH,
                      const HomeTaskCheckWidget(),
                    ],
                  ),
                ),
              ),
              kBigH,
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: KColors.lightPrimary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '수거 내역 관리',
                        style: kHeaderTextStyle.copyWith(),
                      ),
                      kBigH,
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.record);
                          },
                          child: Text('수거 내역 보기')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
