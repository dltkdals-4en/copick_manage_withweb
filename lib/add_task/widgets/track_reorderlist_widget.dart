import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/screen_size.dart';
import '../../provider/firebase_provider.dart';
import '../../provider/task_provider.dart';

class TrackReorderlistWidget extends StatelessWidget {
  const TrackReorderlistWidget(this.trackIndex, this.taskTabController,
      {Key? key})
      : super(key: key);

  final int trackIndex;
  final TabController taskTabController;

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbProvider>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    var track = taskProvider.getTrackList(trackIndex);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('카페 개수 : ${track.length} 개'),
        NorH,
        Expanded(
          child: (track.isEmpty)
              ? Center(
                  child: Text(
                    '수거 일정이 없습니다.',
                    style: makeTextStyle(24, AppColors.black, 'bold'),
                  ),
                )
              : ReorderableListView.builder(
                  buildDefaultDragHandles: false,
                  itemCount: track.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReorderableDragStartListener(
                      index: index,
                      key: ValueKey(track[index]),
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
                                  style: makeTextStyle(
                                      16, AppColors.black, 'bold'),
                                ),
                                NorW,
                                Text(
                                  '${taskProvider.getLocName(track[index].locationId!)}',
                                  style: makeTextStyle(
                                      16, AppColors.black, 'bold'),
                                ),
                                SmW,
                                Text(
                                  '${track[index].locationId}',
                                  style: makeTextStyle(
                                      14, AppColors.blackGrey, 'regular'),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                taskProvider.deleteTask(
                                    fbProvider, track[index].pickDocId!,taskTabController, trackIndex);
                              },
                              child: Text('삭제'),
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                  onReorder: (
                    int oldIndex,
                    int newIndex,
                  ) {
                    taskProvider.indexChange(oldIndex, newIndex, track);
                  },
                ),
        ),
        NorH,
        ElevatedButton(
          onPressed: () {},
          child: Text('경로 저장하기'),
          style: ElevatedButton.styleFrom(),
        )
      ],
    );
  }
}
