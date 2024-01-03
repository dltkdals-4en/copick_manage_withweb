import 'package:copick_manage_withweb/model/pick_task_model.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/fb_helper.dart';
import '../../provider/task_provider.dart';

class TrackReorderlistWidget extends StatelessWidget {
  const TrackReorderlistWidget(this.trackIndex, this.taskTabController,
      {Key? key})
      : super(key: key);

  final int trackIndex;
  final TabController taskTabController;

  @override
  Widget build(BuildContext context) {
    var fbProvider = Provider.of<FbHelper>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    var size = MediaQuery.of(context).size;
    List<PickTaskModel> track = taskProvider.getTrackList(trackIndex);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        kNorH,
        Text('카페 개수 : ${track.length} 개'),
        Divider(),
        Expanded(
          child: (track.isEmpty)
              ? Center(
                  child: Text(
                    '수거 일정이 없습니다.',
                    style: kAppbarTitle.copyWith(),
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
                                    style:
                                        kHeaderTextStyle.copyWith(fontSize: 16),
                                  ),
                                  kNorW,
                                  Text(
                                    '${taskProvider.getLocName(track[index].locationId ?? '알수 없음')}',
                                    style:
                                        kHeaderTextStyle.copyWith(fontSize: 16),
                                  ),
                                  kSmW,
                                  Text('${track[index].locationId}',
                                      style: kTagTextStyle.copyWith(
                                          color: KColors.blackGrey)),
                                  kSmW,
                                  Text('수거 ${track[index].team} 팀',
                                      style: kTagTextStyle.copyWith(
                                          color: KColors.black)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await taskProvider.deleteTask(
                                      track[index].pickDocId!,
                                      trackIndex,
                                      fbProvider);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: KColors.lightPrimary,
                                ),
                                child: Text(
                                  '삭제',
                                  style: kBtnTextStyle.copyWith(),
                                ),
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
                  ) {
                    taskProvider.indexChange(oldIndex, newIndex, track);
                  },
                ),
        ),
        kNorH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                taskProvider.updatePickOrder(track, fbProvider, trackIndex);
              },
              child: Text('${taskProvider.weekDay[trackIndex - 1]}요일 경로 저장하기'),
              style: ElevatedButton.styleFrom(),
            ),
            ElevatedButton(
              onPressed: () {
                taskProvider.deleteAllTask(trackIndex, fbProvider);
              },
              child: Text('${taskProvider.weekDay[trackIndex - 1]}요일 경로 전체 삭제'),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        )
      ],
    );
  }
}
