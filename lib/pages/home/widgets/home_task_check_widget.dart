import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';
import '../../../routes/routes.dart';
import '../../../utilitys/colors.dart';
import '../../../utilitys/constants.dart';

class HomeTaskCheckWidget extends StatelessWidget {
  const HomeTaskCheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<TaskManageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height*2/3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('요일별 태스크 관리',style: kLabelTextStyle.copyWith(), ),
          kNorH,
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => kNorW,
              itemCount: 5,
              itemBuilder: (context, index) {
                // if (index == 5) {
                //   return ElevatedButton(
                //     onPressed: () {},
                //     child: Text('태스크 일괄 추가'),
                //   );
                // } else {
                  return Card(
                    child: Container(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(NORMALGAP),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${ui.getWeekDay(index)}요일',
                                  style: kLabelTextStyle.copyWith(),
                                ),
                                kNorH,
                                Text('태스크 수 : ${ui.getTaskLength(index)}'),
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
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
