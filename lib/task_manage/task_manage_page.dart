
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';

import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:copick_manage_withweb/provider/fb_helper.dart';
import 'package:copick_manage_withweb/task_manage/add_task.dart';
import 'package:copick_manage_withweb/task_manage/widgets/track_reorderlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TaskManagePage extends StatefulWidget {
  const TaskManagePage({Key? key}) : super(key: key);

  @override
  State<TaskManagePage> createState() => _TaskManagePageState();
}

class _TaskManagePageState extends State<TaskManagePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;

    var totalList = taskProvider.totalList;
    TabController taskTabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: taskProvider.currentTaskTabIndex,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddTask(),
            Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '경로별 태스크 목록',
                            style:
                                makeTextStyle(20, AppColors.black, 'bold'),
                          ),
                          Text('총 태스크 개수 : ${totalList.length}'),
                        ],
                      ),
                      const SizedBox(
                        height: SMALLGAP,
                      ),
                      TabBar(
                        controller: taskTabController,
                        labelStyle: makeTextStyle(
                            18, AppColors.lightPrimary, 'bold'),
                        unselectedLabelStyle:
                            makeTextStyle(18, AppColors.black, 'bold'),
                        labelColor: AppColors.lightPrimary,
                        unselectedLabelColor: AppColors.black,
                        labelPadding: const EdgeInsets.all(SMALLGAP),
                        indicatorColor: AppColors.lightPrimary,
                        tabs: const [
                          // Text('전체보기'),
                          Text('월요일'),
                          Text('화요일'),
                          Text('수요일'),
                          Text('목요일'),
                          Text('금요일'),
                        ],
                      ),

                      SizedBox(
                        height: size.height,
                        child: TabBarView(
                          controller: taskTabController,
                          children: [
                            // TotaltrackListWidget(),
                            TrackReorderlistWidget(1, taskTabController),
                            TrackReorderlistWidget(2, taskTabController),
                            TrackReorderlistWidget(3, taskTabController),
                            TrackReorderlistWidget(4, taskTabController),
                            TrackReorderlistWidget(5, taskTabController),
                          ],
                        ),
                      ),

                      // Expanded(
                      //   child: ListView.builder(
                      //     itemCount: locList.length + 1,
                      //     itemBuilder: (context, index) {
                      //       if (index == 0) {
                      //         return Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text('Cafe Code'),
                      //             Text('Name'),
                      //             Text('address'),
                      //           ],
                      //         );
                      //       } else {
                      //         //
                      //         return Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text('${locList[index - 1].locationId}'),
                      //             Text('${locList[index - 1].locationName}'),
                      //             // Text(
                      //             //   taskProvider.getLocName(taskList[index - 1].locationId!),
                      //             //   textAlign: TextAlign.start,
                      //             // ),
                      //             Text('${locList[index - 1].lastCallDate}'),
                      //           ],
                      //         );
                      //       }
                      //     },
                      //   ),
                      // ),
                    ],
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
