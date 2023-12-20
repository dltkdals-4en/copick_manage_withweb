import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';

class HomeTaskAddWidget extends StatelessWidget {
  const HomeTaskAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<TaskManageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '태스크 추가',
          style: kLabelTextStyle.copyWith(),
        ),
        kNorH,
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const Text('개별 태스크 추가'),
            ),
            kNorW,
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(Routes.taskAdd);
              },
              style: ElevatedButton.styleFrom(),
              child: const Text('태스크 일괄 추가'),
            ),
          ],
        ),
      ],
    );
  }
}
