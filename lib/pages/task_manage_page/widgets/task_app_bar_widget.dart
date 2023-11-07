import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';

class TaskAppBarWidget extends StatelessWidget {
  const TaskAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var tabIndex = DefaultTabController.of(context).index;
    return Text('${tmProvider.getWeekDay(tmProvider.selectedDay!-1)}요일 태스크 관리');
  }
}
