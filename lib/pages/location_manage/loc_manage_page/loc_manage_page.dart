import 'package:copick_manage_withweb/provider/location_manage_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:copick_manage_withweb/utilitys/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/task_manage_provider.dart';

class LocManagePage extends StatelessWidget {
  const LocManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tmProvider = Provider.of<TaskManageProvider>(context);
    var locProvider = Provider.of<LocationManageProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(NORMALGAP),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      const Text('매장 리스트'),
                      ElevatedButton(
                          onPressed: () {
                            locProvider.getCafeCode(tmProvider.getMaxCode());
                            Navigator.of(context).pushNamed(Routes.locationAdd);
                          },
                          child: Text('카페 추가하기')),
                    ],
                  ),
                ),
                kNorH,
                TextField(
                  onChanged: (value) {
                    tmProvider.changeLocList(value);
                  },
                  onSubmitted: (value) {
                    tmProvider.changeLocList(value);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tmProvider.locList!.length,
                    itemBuilder: (context, index) {
                      var item = tmProvider.locList![index];
                      return ListTile(
                        title: Text(
                          '${item.locationName}',
                        ),
                        subtitle: Text('${item.locationId}'),
                        trailing: CustomBtn(
                          onPressed: () {},
                          title: '상세보기',
                          fontSize: 10,
                          size: const Size(100, 40),
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
            right: 40,
            child: ElevatedButton(
              onPressed: () async {
                // tmProvider.getGsheets();
              },
              child: const Text('카페 추가'),
            ),
          )
        ],
      ),
    );
  }
}
