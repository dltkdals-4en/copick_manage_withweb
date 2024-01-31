import 'package:copick_manage_withweb/pages/task_add_page/widgets/add_item_widget.dart';
import 'package:copick_manage_withweb/data_helper/fb_helper.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';
import '../../../utilitys/colors.dart';
import '../../../utilitys/constants.dart';

class TaskAddReservelistWidget extends StatelessWidget {
  const TaskAddReservelistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskManageProvider>(context);
    var getDataProvider = Provider.of<GetDataProvider>(context);
    var size = MediaQuery.of(context).size;
    var tItems = taskProvider.addTList;
    var fItems = taskProvider.addFList;
    return Container(
      width: (size.width - 70) / 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: KColors.lightPrimary,
          width: 1,
        ),
        color: KColors.whiteGrey,
      ),
      child: Column(
        children: [
          Container(
            width: (size.width - 70) / 2,
            height: 70,
            color: KColors.white,
            child: Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '요일',
                            style: kLabelTextStyle.copyWith(),
                          ),
                          kSmW,
                          DropdownButton(
                            value: taskProvider.selectedWeek,
                            hint: Text('선택 안됨'),
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '팀',
                            style: kLabelTextStyle.copyWith(),
                          ),
                          kSmW,
                          DropdownButton(
                            value: taskProvider.selectedTeam,
                            hint: Text('선택 안됨'),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          taskProvider.initReserve();
                        },
                        child: Text('초기화하기'),
                      ),
                      kSmW,
                      ElevatedButton(
                        onPressed: () async {
                          if(taskProvider.reserveValidation()){
                            await taskProvider.addReserve().then((value) {
                              getDataProvider.init();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.splash, (route) => false);
                            });
                          }else{
                            print('validation');
                          }
                        },
                        child: Text('경로 추가하기'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: ListView.separated(
                itemCount: tItems.length,
                separatorBuilder: (context, index) => Divider(),
                padding: EdgeInsets.only(bottom: SMALLGAP),
                itemBuilder: (context, index) {
                  var item = tItems[index];
                  return AddItemWidget(
                    item: item,
                    onTap: () {
                      taskProvider.changeState(item);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
