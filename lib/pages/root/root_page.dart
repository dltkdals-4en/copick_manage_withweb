import 'package:copick_manage_withweb/provider/get_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../area_config/area_config.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    var server = Provider.of<GetDataProvider>(context);


    return const Placeholder();
  }
}
