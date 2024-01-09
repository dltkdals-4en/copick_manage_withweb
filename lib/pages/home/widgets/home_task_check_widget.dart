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
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '요일별 태스크 관리',
            style: kLabelTextStyle.copyWith(),
          ),
          kNorH,
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => kSmW,
              itemCount: 5,
              itemBuilder: (context, index) {
                // if (index == 5) {
                //   return ElevatedButton(
                //     onPressed: () {},
                //     child: Text('태스크 일괄 추가'),
                //   );
                // } else {
                return Card(
                  child: SizedBox(
                    width: (size.width - (NORMALGAP * 4 + NORMALGAP * 4)) / 5,
                    child: Padding(
                      padding: const EdgeInsets.all(NORMALGAP),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${tmProvider.getWeekDay(index)}요일',
                              style: kLabelTextStyle.copyWith(),
                            ),
                            kNorH,
                            Text(
                              '태스크 수 : ${tmProvider.getTaskLength(index)}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              '추가 일정: ${tmProvider.getAddedTaskLength(index)}개',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            kSmH,
                            ElevatedButton(
                              onPressed: () {
                                tmProvider.saveTaskIndex(index);
                                tmProvider.getTeamList();
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
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
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
