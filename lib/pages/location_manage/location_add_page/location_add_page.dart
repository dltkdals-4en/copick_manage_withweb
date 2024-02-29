import 'package:copick_manage_withweb/provider/location_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/colors.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';

class LocationAddPage extends StatelessWidget {
  const LocationAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var locProvider = Provider.of<LocationManageProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '카페명',
                      style: kLabelTextStyle.copyWith(),
                    ),
                    TextField(
                      onChanged: (value) {
                        locProvider.changeCafeName(value);
                      },
                    ),
                  ],
                ),
                kNorH,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '위/경도',
                      style: kLabelTextStyle.copyWith(),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
                      ],
                      onChanged: (value) {
                        locProvider.changeGps(value);
                      },
                    ),
                  ],
                ),
                kNorH,
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KColors.lightPrimary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(SMALLGAP),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주차위치',
                          style: kLabelTextStyle.copyWith(),
                        ),
                        kSmH,
                        (locProvider.parkingData == null)
                            ? Text('등록된 이미지가 없습니다.')
                            : Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: locProvider.parkingImage!.image,
                                        fit: BoxFit.contain)),
                              ),
                        kSmH,
                        ElevatedButton(
                          onPressed: () async {
                            await locProvider.uploadParckingImage();
                          },
                          child: Text('이미지 업로드'),
                        ),
                      ],
                    ),
                  ),
                ),
                kNorH,
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KColors.lightPrimary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(SMALLGAP),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '수거장소',
                          style: kLabelTextStyle.copyWith(),
                        ),
                        kSmH,
                        (locProvider.collectData == null)
                            ? Text('등록된 이미지가 없습니다.')
                            : Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: locProvider.collectImage!.image,
                                        fit: BoxFit.contain)),
                              ),
                        kSmH,
                        ElevatedButton(
                          onPressed: () async {
                            await locProvider.uploadCollectImage();
                          },
                          child: Text('이미지 업로드'),
                        ),
                      ],
                    ),
                  ),
                ),
                kBigH,
                ElevatedButton(
                  onPressed: () {
                    locProvider.addCafe();
                  },
                  child: Text(
                    '카페 등록하기',
                    style: kLabelTextStyle.copyWith(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
