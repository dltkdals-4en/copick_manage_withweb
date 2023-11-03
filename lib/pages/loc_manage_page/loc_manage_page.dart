import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:copick_manage_withweb/utilitys/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/task_manage_provider.dart';

class LocManagePage extends StatelessWidget {
  const LocManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<TaskManageProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(NORMALGAP),
            child: Column(
              children: [
                Container(
                  child: Text('매장 리스트'),
                ),
                kNorH,
                TextField(
                  onChanged: (value) {
                    ui.changeLocList(value);
                  },
                  onSubmitted: (value) {
                    ui.changeLocList(value);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ui.locList!.length,
                    itemBuilder: (context, index) {
                      var item = ui.locList![index];
                      return ListTile(
                        title: Text(
                          '${item.locationName}',
                        ),
                        subtitle: Text('${item.locationId}'),
                        trailing: CustomBtn(
                          onPressed: () {},
                          title: '상세보기',
                          fontSize: 10,
                          size: Size(100, 40),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right:  40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('카페 추가'),
            ),
          )
        ],
      ),
    );
  }
}
