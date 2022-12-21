import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/task_provider.dart';

class InputMainInfo extends StatelessWidget {
  const InputMainInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카페 코드 입력',
              style: makeTextStyle(16, AppColors.black, 'bold'),
            ),
            SizedBox(
              height: SMALLGAP,
            ),
            Container(
              width: size.width /4,
              child: TextFormField(
                cursorColor: AppColors.lightPrimary,
                controller: taskProvider.codeTextController,
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
                  } else if (!RegExp(r'^(?:[A-Z]{1})(?:[0-9]{5})$')
                      .hasMatch(text)) {
                    return '형식에 맞지않습니다.';
                  } else if (taskProvider.locList
                      .where((element) => element.locationId == text)
                      .isNotEmpty) {
                    return '이미 등록된 코드입니다.';
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
              style: makeTextStyle(16, AppColors.black, 'bold'),
            ),
            SizedBox(
              height: SMALLGAP,
            ),
            Container(
              width: size.width / 3,
              child: TextFormField(
                controller: taskProvider.nameTextController,
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
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '매장명을 입력해주세요.';
                  }  else if (taskProvider.locList
                      .where((element) => element.locationName == text)
                      .isNotEmpty) {
                    return '이미 등록된 매장입니다.';
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
