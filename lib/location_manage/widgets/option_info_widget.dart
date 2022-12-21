import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_provider.dart';

class OptionInfoWidget extends StatelessWidget {
  const OptionInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '선택 정보 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        NorH,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '담당자명',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.adminTextController,
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
                  '매장 전화 번호',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.telController,
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
                  '카페 이미지',
                  style: makeTextStyle(16, AppColors.black, 'bold'),
                ),
                SmH,
                Container(
                  width: size.width / 4,
                  child: TextField(
                    controller: taskProvider.postalController,
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
