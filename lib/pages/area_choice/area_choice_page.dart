import 'package:copick_manage_withweb/pages/area_config/area_config.dart';
import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:copick_manage_withweb/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AreaChoicePage extends StatelessWidget {
  const AreaChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    var server  = Provider.of<GetDataProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            server.changeArea(Area.seongdong);
            Navigator.pushNamed(context, Routes.root);
          }, child: Text('성동'),),
          ElevatedButton(onPressed: () {
            server.changeArea(Area.anseong);
            Navigator.pushNamed(context, Routes.root);
          }, child: Text('안성'),),
        ],
      ),
    );
  }
}
