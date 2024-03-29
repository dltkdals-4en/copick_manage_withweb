import 'package:copick_manage_withweb/provider/manage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/fb_helper.dart';
import '../provider/task_provider.dart';
import 'widgets/input_code_widget.dart';
import 'widgets/input_track_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var manageProvider = Provider.of<ManageProvider>(context);
    var size = MediaQuery.of(context).size;
    final addTaskFormKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: addTaskFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '일정 추가하기',
                      style: makeTextStyle(20, AppColors.black, 'bold'),
                    ),
                    InkWell(
                      onTap: () {
                        manageProvider.changeAddTaskWidget();
                      },
                      child: Row(
                        children: [
                          (manageProvider.taskAddWidgetVisible)
                              ? const Text('접기')
                              : const Text('펼치기'),
                          (manageProvider.taskAddWidgetVisible)
                              ? const Icon(Icons.arrow_drop_up_outlined)
                              : const Icon(Icons.arrow_drop_down_outlined),
                        ],
                      ),
                    ),
                  ],
                ),

                Visibility(
                  visible: manageProvider.taskAddWidgetVisible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      const InputCodeWidget(),
                      NorH,
                      const Divider(),
                      const InputTrackWidget(),
                      const Divider(),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (addTaskFormKey.currentState!.validate()) {
                              if (taskProvider.selectedWeek == null) {
                                print('check');
                              } else {
                                print('team: ${taskProvider.selectedTeam}//week ${taskProvider.selectedWeek}');
                                await taskProvider.addTaskData(fbProvider);

                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightPrimary),
                          child: const Text('태스크 추가하기'),
                        ),
                      ),
                    ],
                  ),
                ),

                // TaskDataInputWidget(
                //     '수거 일자 입력', TextInputType.number, size.width / 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
