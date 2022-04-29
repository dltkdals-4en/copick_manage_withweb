import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/screen_size.dart';
import '../../provider/add_task_provider.dart';
import 'input_loc_info.dart';
import 'input_main_info.dart';

class RequiredInfoWidget extends StatelessWidget {
  const RequiredInfoWidget(this.formKey,{Key? key}) : super(key: key);

  final formKey;
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var locList = taskProvider.locList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카페 추가하기',
          style: makeTextStyle(20, AppColors.black, 'bold'),
        ),
        Divider(),
        Column(
          children: [
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
                  InputMainInfo(),
                  SizedBox(
                    height: SMALLGAP,
                  ),
                  InputLocInfo(),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
