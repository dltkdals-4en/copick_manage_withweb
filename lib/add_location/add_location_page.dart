import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:copick_manage_withweb/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key}) : super(key: key);

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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(NORMALGAP),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(SMALLGAP),
              ),
              child: Padding(
                padding: const EdgeInsets.all(NORMALGAP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '카페 목록',
                          style: makeTextStyle(20, AppColors.black, 'bold'),
                        ),
                        Text('카페 개수 : ${locList.length}'),
                      ],
                    ),
                    SizedBox(
                      height: SMALLGAP,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: locList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('카페 코드'),
                                Text('카페명 '),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${locList[index - 1].locationId}'),
                                Text(
                                  '${locList[index - 1].locationName}',
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: NORMALGAP,
            ),
            Container(
              width: size.width,
              height: size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(SMALLGAP),
              ),
              child: Padding(
                padding: const EdgeInsets.all(NORMALGAP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '카페 추가하기',
                      style: makeTextStyle(20, AppColors.black, 'bold'),
                    ),
                    Divider(),
                    Text(
                      '필수 정보 입력',
                      style: makeTextStyle(18, AppColors.black, 'bold'),
                    ),
                    SizedBox(
                      height: NORMALGAP,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputMainInfo(size: size, taskProvider: taskProvider),
                          SizedBox(
                            height: SMALLGAP,
                          ),
                          InputLocInfo(size: size),

                        ],
                      ),
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

class InputMainInfo extends StatelessWidget {
  const InputMainInfo({
    Key? key,
    required this.size,
    required this.taskProvider,
  }) : super(key: key);

  final Size size;
  final AddTaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카페 코드 입력',
              style: makeTextStyle(
                  16, AppColors.black, 'bold'),
            ),
            SizedBox(
              height: SMALLGAP,
            ),
            Container(
              width: size.width / 3,
              child: TextFormField(
                cursorColor: AppColors.lightPrimary,
                controller:
                    taskProvider.codeTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightPrimary,
                      width: 2,
                    ),
                  ),
                  focusColor: AppColors.lightPrimary,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '코드를 입력해주세요.';
                  } else if (text.length > 6) {
                    return '길이가 맞지않습니다.';
                  } else if (!RegExp(
                          r'^(?:[A-Z]{1})(?:[0-9]{5})$')
                      .hasMatch(text)) {
                    return '형식에 맞지않습니다.';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          width: NORMALGAP,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카페 이름 입력',
              style: makeTextStyle(
                  16, AppColors.black, 'bold'),
            ),
            SizedBox(
              height: SMALLGAP,
            ),
            Container(
              width: size.width / 3,
              child: const TextField(
                cursorColor: AppColors.lightPrimary,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightPrimary,
                      width: 2,
                    ),
                  ),
                  focusColor: AppColors.lightPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InputLocInfo extends StatelessWidget {
  const InputLocInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '주소 입력',
          style:
              makeTextStyle(16, AppColors.black, 'bold'),
        ),
        SmH,
        Container(
          width: size.width / 2,
          child: const TextField(
            cursorColor: AppColors.lightPrimary,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightPrimary,
                  width: 2,
                ),
              ),
              focusColor: AppColors.lightPrimary,
            ),
          ),
        ),
        SmH,
        Row(
          children: [
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  '위도',
                  style: makeTextStyle(
                      16, AppColors.black, 'bold'),
                ),
                SizedBox(
                  height: SMALLGAP,
                ),
                Container(
                  width: size.width / 3,
                  child: const TextField(
                    cursorColor: AppColors.lightPrimary,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.lightPrimary,
                          width: 2,
                        ),
                      ),
                      focusColor: AppColors.lightPrimary,
                    ),
                  ),
                ),
              ],
            ),
            NorW,
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  '경도',
                  style: makeTextStyle(
                      16, AppColors.black, 'bold'),
                ),
                SizedBox(
                  height: SMALLGAP,
                ),
                Container(
                  width: size.width / 3,
                  child: const TextField(
                    cursorColor: AppColors.lightPrimary,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.lightPrimary,
                          width: 2,
                        ),
                      ),
                      focusColor: AppColors.lightPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
