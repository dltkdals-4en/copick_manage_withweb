import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../provider/firebase_provider.dart';
import '../../provider/task_provider.dart';

class ModifyWeekdayDialog extends StatelessWidget {
  const ModifyWeekdayDialog(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbProvider>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var data = taskProvider.totalList[index];
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        '수거 요일 수정',
        style: makeTextStyle(20, AppColors.black, 'bold'),
      ),
      content: Container(
        width: size.width / 2,
        height: size.height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.locationName}',
              style: makeTextStyle(18, AppColors.black, 'bold'),
            ),
            Container(
              width: size.width / 2,
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text('${taskProvider.weekDay[index]}'),
                      Checkbox(
                          value: taskProvider.modifyValue[index],
                          onChanged: (value) {
                            taskProvider.modifyCheck(index);
                          }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {

            Navigator.pop(context);
          },
          child: Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {

          },
          child: Text('수정'),
        ),
      ],
    );
  }
}
