import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InputCodeWidget extends StatelessWidget {
  const InputCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카페 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        SizedBox(
          height: SMALLGAP,
        ),
        DropdownButton<String>(
          value: taskProvider.initialName,
          items: taskProvider.nameList.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text('$e'),
            );
          }).toList(),
          onChanged: (String? value) {
            taskProvider.selectedName(value);
          },
        ),

      ],
    );
  }
}
