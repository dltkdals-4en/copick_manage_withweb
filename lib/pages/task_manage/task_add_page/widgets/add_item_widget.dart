import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utilitys/constants.dart';



class AddItemWidget extends StatelessWidget {
  const AddItemWidget({required this.item, required this.onTap, super.key});

  final Map<String, dynamic> item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskManageProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SMALLGAP),
        color: KColors.white,
      ),
      child: ListTile(
        title: Text('${item['waste'].locationName}'),
        onTap: onTap,
        contentPadding: EdgeInsets.all(NORMALGAP),
      ),
    );
  }
}
