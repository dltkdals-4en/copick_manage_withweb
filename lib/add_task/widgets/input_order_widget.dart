import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputOrderWidget extends StatelessWidget {
  const InputOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '수거 순서 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        SizedBox(
          height: SMALLGAP,
        ),
        Container(
          width: size.width / 3,
          child: TextFormField(
            cursorColor: AppColors.lightPrimary,
            controller: taskProvider.orderTextController,
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
            validator: (text){
              print('text : $text');
              if(text == null || text.isEmpty){
                print('vvv');
                return '값을 입력해주세요.';
              }
            },
          ),
        ),
      ],
    );
  }
}
