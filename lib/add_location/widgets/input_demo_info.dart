import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../provider/task_provider.dart';

class InputDemoInfo extends StatelessWidget {
  const InputDemoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '데모 태스크 정보 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        NorH,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'demo code',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.demoCodeController,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'track',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.trackController,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'order',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.orderController,
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
        SmH,
      ],
    );
  }
}
