
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_provider.dart';
import '../../constants/constants.dart';
import '../../utilitys/constants.dart';
import 'input_loc_info.dart';
import 'input_main_info.dart';

class RequiredInfoWidget extends StatelessWidget {
  const RequiredInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '필수 정보 입력',
              style: makeTextStyle(18, AppColors.black, 'bold'),
            ),
            // kNorW,
            // DropdownButton(
            //   value: taskProvider.selectedCity,
            //   items: taskProvider.city.map((e) {
            //     return DropdownMenuItem<String>(child: Text(e),
            //     value: e,);
            //   }).toList(),
            //   onChanged: (value) {
            //       taskProvider.changeCity(value);
            //   },
            // ),
          ],
        ),
        SizedBox(
          height: NORMALGAP,
        ),
        InputMainInfo(),
        SizedBox(
          height: SMALLGAP,
        ),
        InputLocInfo(),
      ],
    );
  }
}
