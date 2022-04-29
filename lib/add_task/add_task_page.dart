import 'package:copick_manage_withweb/add_task/widgets/input_code_widget.dart';
import 'package:copick_manage_withweb/add_task/widgets/input_track_widget.dart';
import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbProvider>(context);
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;
    var taskList = taskProvider.taskList;
    var track1 = taskProvider.taskListTrack1;
    var track2 = taskProvider.taskListTrack2;
    var track3 = taskProvider.taskListTrack3;
    TabController tabController = TabController(length: 3, vsync: this);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: size.width,
                  height: size.height / 2,
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
                              style: makeTextStyle(20, AppColors.black, 'bold'),
                            ),
                            Text('총 태스크 개수 : ${taskList.length}'),
                          ],
                        ),
                        SizedBox(
                          height: SMALLGAP,
                        ),
                        TabBar(
                          controller: tabController,
                          labelStyle:
                              makeTextStyle(18, AppColors.lightPrimary, 'bold'),
                          unselectedLabelStyle:
                              makeTextStyle(18, AppColors.black, 'bold'),
                          labelColor: AppColors.lightPrimary,
                          unselectedLabelColor: AppColors.black,
                          labelPadding: EdgeInsets.all(SMALLGAP),
                          tabs: [
                            Text('경로 1'),
                            Text('경로 2'),
                            Text('경로 3'),
                          ],
                        ),
                        Container(
                          height: size.height / 3,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              Container(
                                height: size.height / 3,
                                child: ListView.builder(
                                  itemCount: track1.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Text('title');
                                    } else {
                                      return Text(taskProvider.getLocName(
                                          track1[index - 1].locationId!));
                                    }
                                  },
                                ),
                              ),
                              Container(
                                height: size.height / 3,
                                child: Text('2'),
                              ),
                              Container(
                                height: size.height / 3,
                                child: Text('3'),
                              ),
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
              Padding(
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
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '태스크 추가하기',
                            style: makeTextStyle(20, AppColors.black, 'bold'),
                          ),
                          SizedBox(
                            height: NORMALGAP,
                          ),
                          Divider(
                            height: 2,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: NORMALGAP,
                          ),
                          InputCodeWidget(),

                          SizedBox(
                            height: SMALLGAP,
                          ),
                          Divider(),
                          InputTrackWidget(),
                          SizedBox(
                            width: NORMALGAP,
                          ),
                          // InputOrderWidget(),
                          SizedBox(
                            height: SMALLGAP,
                          ),
                          Divider(),
                          SizedBox(
                            height: NORMALGAP,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                taskProvider.addTaskData(fbProvider);
                              }
                            },
                            child: Text('태스크 추가하기'),
                          )
                          // TaskDataInputWidget(
                          //     '수거 일자 입력', TextInputType.number, size.width / 3),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
