import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/task_provider.dart';

class SeongsuHomePage extends StatelessWidget {
  const SeongsuHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var list = taskProvider.taskList;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${list.length} 개'),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                          padding: EdgeInsets.all(SMALLGAP),
                          child: ListTile(
                            title: Text('${index+1} ${list[index].locationName}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${list[index].locationId}'),
                                Text('${list[index].pickUpDate}'),
                              ],
                            ),
                          ),),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () async {
                await taskProvider.insertGsheets();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 50),
              ),
              child: Text('전송'),
            ),
          ),
        ],
      ),
    );
  }
}
