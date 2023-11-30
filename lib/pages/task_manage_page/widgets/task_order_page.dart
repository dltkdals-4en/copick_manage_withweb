import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';
import '../../../utilitys/colors.dart';
import '../../../utilitys/constants.dart';

class TaskOrderPage extends StatelessWidget {
  const TaskOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var tabIndex = DefaultTabController.of(context).index;
    var items = tmProvider.teamList![tabIndex];
    return Padding(
      padding: const EdgeInsets.all(NORMALGAP),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('카페 개수 : ${items.length} 개'),

              ],
            ),
          ),
          kBigH,
          Expanded(
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return ReorderableDragStartListener(
                  index: index,
                  key: ValueKey(item),
                  child: Card(
                    elevation: 3,
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
                                style: kLabelTextStyle.copyWith(),
                              ),
                              kNorW,
                              Text(
                                item.locationName??'',
                                style: kLabelTextStyle.copyWith(),
                              ),
                              kSmW,
                              Text(
                                '${item.locationId}',
                                style: kContentTextStyle.copyWith(),
                              ),
                              kSmW,
                              Text(
                                '수거 ${item.team}팀',
                                style: kContentTextStyle.copyWith(),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColors.lightPrimary,
                            ),
                            child: const Text('삭제'),
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
            ),
          ),
        ],
      ),
    );
  }
}
