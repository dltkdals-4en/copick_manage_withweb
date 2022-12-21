import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';



class InputDateWidget extends StatelessWidget {
  const InputDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    var taskProvider = Provider.of<TaskProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '수거 일자 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),

        SizedBox(
          height: SMALLGAP,
        ),
        Text(
          '날짜 입력을 안할 경우, 자동으로 내일 날짜로 등록됩니다.',
          style:
          makeTextStyle(16, AppColors.blackGrey, 'regular'),
          softWrap: true,
          overflow: TextOverflow.ellipsis,

        ),
        SizedBox(
          height: SMALLGAP,
        ),
        Row(
          children: [
            // Container(
            //   width: size.width / 3,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: size.width / 5,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            Text(
              '등록일 : ',
              style: makeTextStyle(16, AppColors.black, 'medium'),
            ),
            Container(
              width: size.width / 5,
              child: Text(
                DateFormat('yyyy/MM/dd')
                    .format(taskProvider.dateTime),
                style:
                makeTextStyle(16, AppColors.black, 'medium'),
              ),
              // TextFormField(
              //   controller: taskProvider.dateTextController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: DateFormat('yyyy/MM/dd').format(taskProvider.dateTime),
              //   ),
              //
              //   validator: (text){
              //
              //   },
              // ),
            ),
            SizedBox(
              width: NORMALGAP,
            ),
            Container(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  taskProvider.dateSelect(context);
                },
                child: Text('일자 선택'),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.lightPrimary,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
