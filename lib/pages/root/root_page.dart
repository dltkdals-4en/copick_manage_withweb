import 'package:copick_manage_withweb/pages/home/home_page.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/provider/task_manage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilitys/loading_screen.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<GetDataProvider>(context);
    var tmProvider = Provider.of<TaskManageProvider>(context);
    return FutureBuilder(
      future: data.getLocData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || !snapshot.data!) {
            return const LoadingScreen(
              text: "오류 발생",
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!) {
              return FutureBuilder(
                future: data.getTaskData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const LoadingScreen(
                        text: "오류 발생",
                      );
                    } else {
                      tmProvider.selectedArea = data.areaInfo;
                      tmProvider.taskList = data.taskList;
                      tmProvider.sortLocList(data.locList);
                      return const HomePage();
                    }
                  } else {
                    return const LoadingScreen(
                      text: '태스크 정보 불러오는 중',
                    );
                  }
                },
              );
            } else {
              return const LoadingScreen(
                text: '매장 정보 불러오는 중',
              );
            }
          } else {
            return const LoadingScreen();
          }
        } else {
          return const LoadingScreen(
            text: '매장 정보 불러오는 중',
          );
        }

        //   if (snapshot.hasData) {
        //     return FutureBuilder(
        //       future: data.getTaskData(),
        //       builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           tmProvider.selectedArea = data.areaInfo;
        //           tmProvider.taskList = data.taskList;
        //           tmProvider.sortLocList(data.locList);
        //           return HomePage();
        //         } else {
        //           return const LoadingScreen(text: '태스크 정보 불러오는 중',);
        //         }
        //       },
        //     );
        //   } else {
        //     return const LoadingScreen(text: '매장 정보 불러오는 중',);
        //   }
      },
    );
    if (!data.haveLoc) {
      data.getLocData();
      return const LoadingScreen();
    } else if (!data.haveTask) {
      data.getTaskData();
      return const LoadingScreen();
    } else {
      tmProvider.selectedArea = data.areaInfo;
      tmProvider.taskList = data.taskList;
      tmProvider.sortLocList(data.locList);

      // ui.wasteList = data.locList;

      return const HomePage();
    }
  }
}
