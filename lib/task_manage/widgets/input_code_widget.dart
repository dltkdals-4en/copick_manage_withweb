import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputCodeWidget extends StatelessWidget {
  const InputCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카페 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        const SizedBox(
          height: SMALLGAP,
        ),
        SizedBox(
          width: size.width / 3,
          child: DropdownButtonFormField<String>(
            value: taskProvider.initialName,
            hint: const Text('매장 선택'),
            items: taskProvider.nameList.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (String? value) {
              taskProvider.selectedName(value);
            },
            validator: (value) {
              if (value == null) {
                return "매장을 선택해주세요";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
