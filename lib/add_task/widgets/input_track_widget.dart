import 'package:copick_manage_withweb/constants/constants.dart';
import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InputTrackWidget extends StatelessWidget {
  const InputTrackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '수거 경로 및 순서 입력',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        SizedBox(
          height: SMALLGAP,
        ),
        Container(
          width: size.width / 2,
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.checkValue.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text('${provider.weekDay[index]}'),
                  Checkbox(
                      value: provider.checkValue[index],
                      onChanged: (value) {
                        provider.valueCheck(index);
                      }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
