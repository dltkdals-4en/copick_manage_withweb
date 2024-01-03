import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskAddPage extends StatelessWidget {
  const TaskAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskManageProvider>(context);
    var items = taskProvider.addList;
    var size = MediaQuery.of(context).size;
    var tItems = taskProvider.addTList;
    var fItems = taskProvider.addFList;

    return Scaffold(
      appBar: AppBar(
        title: Text('태스크 추가하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('요일 선택'),
                    DropdownButton(
                      value: taskProvider.selectedWeek,
                      items: taskProvider.weekDay.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        taskProvider.changeWeek(value);
                      },
                    ),
                  ],
                ),
                kBigW,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('팀 선택'),
                    DropdownButton(
                      value: taskProvider.selectedTeam,
                      items: taskProvider.team.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        taskProvider.changeTeam(value);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: (size.width - 70) / 2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KColors.lightPrimary,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(NORMALGAP),
                      child: ListView.separated(
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 3,
                        //     childAspectRatio: 3,
                        //     crossAxisSpacing: NORMALGAP,
                        //     mainAxisSpacing: NORMALGAP),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: fItems.length,
                        padding: EdgeInsets.only(bottom: SMALLGAP),
                        itemBuilder: (context, index) {
                          var item = fItems[index];
                          return ListTile(
                            title: Text(
                                '${item['waste'].locationName} // ${item['state']}'),
                            onTap: () {
                              taskProvider.changeState(item);
                            },
                            contentPadding: EdgeInsets.all(NORMALGAP),
                          );
                          // return CheckboxListTile(
                          //   value: item['state'],
                          //   onChanged: (value) {
                          //     taskProvider.changeState(item, value);
                          //   },
                          //   title: Text(
                          //       '${item['waste'].locationName} // ${item['state']}'),
                          //   controlAffinity: ListTileControlAffinity.platform,
                          //   // shape: RoundedRectangleBorder(
                          //   //   side: BorderSide(color: KColors.black, width: 1,),
                          //   //   borderRadius: BorderRadius.circular(SMALLGAP),
                          //   // ),
                          //
                          //   contentPadding: EdgeInsets.all(NORMALGAP),
                          // );
                        },
                      ),
                    ),
                  ),
                  // kSmW,
                  // Container(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: () {},
                  //         child: Text('추가'),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: () {},
                  //         child: Text('제거'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // kSmW,
                  kBigW,
                  Container(
                    width: (size.width - 70) / 2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KColors.lightPrimary,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(NORMALGAP),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              '추가 탭 \n ${tItems.length}개 추가됨',
                              style: kHeaderTextStyle.copyWith(),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: tItems.length,
                              separatorBuilder: (context, index) => Divider(),
                              padding: EdgeInsets.only(bottom: SMALLGAP),
                              itemBuilder: (context, index) {
                                var item = tItems[index];
                                return ListTile(
                                  title: Text(
                                      '${item['waste'].locationName} // ${item['state']}'),
                                  onTap: () {
                                    taskProvider.changeState(item);
                                  },
                                  contentPadding: EdgeInsets.all(NORMALGAP),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('경로 추가하기'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
