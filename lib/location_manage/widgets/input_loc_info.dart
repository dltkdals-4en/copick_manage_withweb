import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/task_provider.dart';


class InputLocInfo extends StatelessWidget {
  const InputLocInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '주소 입력',
          style: makeTextStyle(16, AppColors.black, 'bold'),
        ),
        SmH,
        Container(
          width: size.width / 2,
          child: TextField(
            controller: taskProvider.addressTextController,
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
        Text(
          '위/경도 입력',
          style: makeTextStyle(16, AppColors.black, 'bold'),
        ),
        SmH,
        Container(
          width: size.width * 2 / 3,
          child: TextFormField(
            controller: taskProvider.latlngController,
            cursorColor: AppColors.lightPrimary,
            decoration: const InputDecoration(
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
                return '값을 입력해주세요.';
              } else if (!RegExp(
                      r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$')
                  .hasMatch(text)) {
                return '형식이 맞지 않습니다.';
              }
            },
          ),
        ),
        // Row(
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '위도',
        //           style: makeTextStyle(16, AppColors.black, 'bold'),
        //         ),
        //         SizedBox(
        //           height: SMALLGAP,
        //         ),
        //         Container(
        //           width: size.width / 3,
        //           child: TextField(
        //             controller: taskProvider.latTextController,
        //             cursorColor: AppColors.lightPrimary,
        //             decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               focusedBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: AppColors.lightPrimary,
        //                   width: 2,
        //                 ),
        //               ),
        //               focusColor: AppColors.lightPrimary,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     NorW,
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '경도',
        //           style: makeTextStyle(16, AppColors.black, 'bold'),
        //         ),
        //         SizedBox(
        //           height: SMALLGAP,
        //         ),
        //         Container(
        //           width: size.width / 3,
        //           child: TextField(
        //             controller: taskProvider.longTextController,
        //             cursorColor: AppColors.lightPrimary,
        //             decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               focusedBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: AppColors.lightPrimary,
        //                   width: 2,
        //                 ),
        //               ),
        //               focusColor: AppColors.lightPrimary,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
