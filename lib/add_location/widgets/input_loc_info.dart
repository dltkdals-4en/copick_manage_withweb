import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/screen_size.dart';
import '../../provider/add_task_provider.dart';

class InputLocInfo extends StatelessWidget {
  const InputLocInfo({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
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