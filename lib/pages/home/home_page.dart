import 'package:copick_manage_withweb/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Text(ui.selectedArea!.title ?? ''),
          Text('${ui.wasteList!.length}'),
          Text('${ui.taskList!.length}'),
        ],
      ),
    );
  }
}
