import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:copick_manage_withweb/utilitys/custom_btn.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<TaskManageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          children: [
            Container(
              child: Text(
                '${ui.selectedArea!.title} 수거 정보',
                style: kHeaderTextStyle.copyWith(),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('총 매장 개수 : ${ui.wasteList!.length}'),
                    kNorH,
                    CustomBtn(
                      onPressed: () {
                        ui.changeLocList(null);
                        Navigator.pushNamed(context, Routes.location);
                      },
                      title: '매장 관리',
                      size: Size(100, 50),
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
            kBigH,
            Expanded(
              child: Container(
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) => kNorW,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      if (index == 5) {
                        return ElevatedButton(
                          onPressed: () {},
                          child: Text('태스크 일괄 추가'),
                        );
                      } else {
                        return Card(
                          child: Container(
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(SMALLGAP),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${ui.getWeekDay(index)}요일',
                                        style: kLabelTextStyle.copyWith(),
                                      ),
                                      kNorH,
                                      Text(
                                          '태스크 수 : ${ui.getTaskLength(index)}'),
                                      kSmH,
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      ui.saveTaskIndex(index);
                                      Navigator.pushNamed(context, Routes.task);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: KColors.lightPrimary,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(SMALLGAP),
                                      child: Text(
                                        '태스크 관리',
                                        style: kContentTextStyle.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: KColors.white),
                                      ),
                                    ),
                                  ),
                                  // CustomBtn(
                                  //   onPressed: () {
                                  //     ui.saveTaskIndex(index);
                                  //     Navigator.pushNamed(context, Routes.task);
                                  //   },
                                  //   title: '태스크 관리',
                                  //   fontSize: 16,
                                  // )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
