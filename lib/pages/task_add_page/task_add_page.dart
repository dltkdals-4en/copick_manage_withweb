import 'package:copick_manage_withweb/pages/task_add_page/widgets/add_item_widget.dart';
import 'package:copick_manage_withweb/pages/task_add_page/widgets/task_add_cafelist_widget.dart';
import 'package:copick_manage_withweb/pages/task_add_page/widgets/task_add_reservelist_widget.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskAddPage extends StatelessWidget {
  const TaskAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('태스크 추가하기'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(NORMALGAP),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  TaskAddCafelistWidget(),
                  kBigW,
                  TaskAddReservelistWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
