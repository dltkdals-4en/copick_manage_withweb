import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/add_task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class InputTrackWidget extends StatelessWidget {
  const InputTrackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<AddTaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '수거 경로 및 순서 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        SizedBox(
          height: SMALLGAP,
        ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text('경로 입력 : '),
                  DropdownButton<int>(
                    value: taskProvider.trackValue,
                    items:
                        taskProvider.trackItems.map<DropdownMenuItem<int>>((e) {
                      return DropdownMenuItem<int>(
                        value: e,
                        child: (e==0)?Text('경로 선택'):Text(
                          '경로 $e',
                        ),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      taskProvider.selectedTrack(value);
                    },

                  ),
                ],
              ),
              SizedBox(
                width: NORMALGAP,
              ),
              Row(
                children: [
                  Text('순서 입력 : '),
                  Container(
                    width: size.width / 4,
                    height: 45,
                    child: Center(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        controller: taskProvider.orderTextController,
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
                          hintText: '숫자만 입력해주세요.',

                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text) {
                          print('text : $text');
                          if (text == null || text.isEmpty) {
                            return '값을 입력해주세요.';
                          } else if (text.length > 2) {
                            return '2자리 숫자까지 입력 가능합니다.';
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
