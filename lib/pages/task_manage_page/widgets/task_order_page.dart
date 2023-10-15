import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../constants/screen_size.dart';
import '../../../provider/ui_provider.dart';
import '../../../utilitys/colors.dart';

class TaskOrderPage extends StatelessWidget {
  const TaskOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiProvider>(context);
    var items = ui.taskDayList;
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      itemCount: items!.length,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return ReorderableDragStartListener(
          index: index,
          key: ValueKey(item),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${index + 1}',
                        style: makeTextStyle(16, KColors.black, 'bold'),
                      ),
                      NorW,
                      Text(
                        ui.getLocName(item.locationId),
                        style: makeTextStyle(16, AppColors.black, 'bold'),
                      ),
                      SmW,
                      Text(
                        '',
                        style: makeTextStyle(
                            14, KColors.blackGrey, 'regular'),
                      ),
                      SmW,
                      Text(
                        '수거  팀',
                        style:
                        makeTextStyle(14, KColors.black, 'regular'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KColors.lightPrimary,
                    ),
                    child: Text('삭제'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onReorder: (
          int oldIndex,
          int newIndex,
          ) {},
    );
  }
}
