import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/task_manage_provider.dart';
import '../../../../routes/routes.dart';
import '../../../../utilitys/colors.dart';
import '../../../../utilitys/constants.dart';

class TaskOrderPage extends StatelessWidget {
  const TaskOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var getDataProvider = Provider.of<GetDataProvider>(context);
    var tabIndex = DefaultTabController.of(context).index;
    var items = tmProvider.teamList![tabIndex];
    return Padding(
      padding: const EdgeInsets.all(NORMALGAP),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('카페 개수 : ${items.length} 개'),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tmProvider.makeAddList(tabIndex);

                        Navigator.of(context).pushNamed(Routes.taskAdd);
                      },
                      child: Text('${tmProvider.team[tabIndex]}팀 태스크 추가'),
                    ),
                    kNorW,
                    ElevatedButton(
                      onPressed: () async{
                        await tmProvider.deleteWithWeekTeam(tabIndex).whenComplete(() async {
                          await getDataProvider.initTask().whenComplete(() {
                            tmProvider.taskList = getDataProvider.taskList;
                            tmProvider.getDayList(tmProvider.selectedDay!);
                          });
                        });
                      },
                      child: Text('${tmProvider.team[tabIndex]}팀 태스크 삭제'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          kBigH,
          Expanded(
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return ReorderableDragStartListener(
                  index: index,
                  key: ValueKey(item),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(NORMALGAP),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${index + 1}',
                                style: kLabelTextStyle.copyWith(),
                              ),
                              kNorW,
                              Text(
                                item.locationName ?? '',
                                style: kLabelTextStyle.copyWith(),
                              ),
                              kSmW,
                              Text(
                                '${item.locationId}',
                                style: kContentTextStyle.copyWith(),
                              ),
                              kSmW,
                              Text(
                                '수거 ${tmProvider.convertTeam(item.team!)}팀',
                                style: kContentTextStyle.copyWith(),
                              ),
                              kSmW,
                              Text(
                                '수거 ${item.track} 트랙',
                                style: kContentTextStyle.copyWith(),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await getDataProvider
                                  .deleteTaskData(item.pickDocId!)
                                  .whenComplete(() {
                                tmProvider.taskList = getDataProvider.taskList;
                                tmProvider.getDayList(tmProvider.selectedDay!);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColors.lightPrimary,
                            ),
                            child: Text(
                              '삭제',
                              style: kBtnTextStyle.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              onReorder: (
                int oldIndex,
                int newIndex,
              ) {},
            ),
          ),
        ],
      ),
    );
  }
}
