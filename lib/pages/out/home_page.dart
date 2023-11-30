import 'package:copick_manage_withweb/constants/screen_size.dart';
import 'package:copick_manage_withweb/provider/manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageOut extends StatelessWidget {
  const HomePageOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var manage = Provider.of<ManageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: KColors.black),
                ),
                height: size.height * 3 / 4,
                child: Padding(
                  padding: const EdgeInsets.all(NORMALGAP),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 140) / 3,
                        decoration: BoxDecoration(
                          border: Border.all(color: KColors.black),
                        ),
                        child: Column(
                          children: [
                            Text(manage.loc1),
                            const Text('안성'),
                            ElevatedButton(
                              onPressed: () {
                                manage.changeLoc1();
                              },
                              child: const Text('push'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width - 140) / 3,
                        decoration: BoxDecoration(
                          border: Border.all(color: KColors.black),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) => Text('매장 $index'),
                          itemCount: 200,
                        ),
                      ),
                      Container(
                        width: (size.width - 140) / 3,
                        decoration: BoxDecoration(
                          border: Border.all(color: KColors.black),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              Text('매장 관련 정보 $index'),
                          itemCount: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
