import 'package:copick_manage_withweb/provider/ui_provider.dart';
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
    var ui = Provider.of<UiProvider>(context);
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: size.width - 82,
                          height: 120,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => kNorW,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                width: (size.width - 82 - 100) / 5,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${ui.getWeekDay(index)}요일',
                                      style: kLabelTextStyle.copyWith(),
                                    ),
                                    kNorH,
                                    Text('태스크 수 : ${ui.getTaskLength(index)}'),
                                    kSmH,
                                    CustomBtn(
                                      onPressed: () {
                                        ui.saveTaskIndex(index);
                                        Navigator.pushNamed(
                                            context, Routes.task);
                                      },
                                      title: '태스크 관리',
                                      fontSize: 10,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
