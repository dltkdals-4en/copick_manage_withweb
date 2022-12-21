import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_provider.dart';
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
        Text(
          '필수 정보 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
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
