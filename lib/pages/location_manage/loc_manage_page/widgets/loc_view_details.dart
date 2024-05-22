import 'package:cached_network_image/cached_network_image.dart';
import 'package:copick_manage_withweb/provider/location_manage_provider.dart';
import 'package:copick_manage_withweb/utilitys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocViewDetails extends StatelessWidget {
  const LocViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var loc = Provider.of<LocationManageProvider>(context);
    return AlertDialog(
      title: Text(
        'Title',
        style: cHeaderTextStyle.copyWith(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(hintText: '카페 00'),
          ),
          TextField(
            decoration: InputDecoration(hintText: '위/경도'),
          ),
          Column(
            children: [
              Text('수거 위치'),
              Text('image1'),
              ElevatedButton(
                onPressed: () {},
                child: Text('이미지 업로드'),
              ),
            ],
          ),
          Column(
            children: [
              Text('수거 위치'),
              CachedNetworkImage(
                imageUrl: loc.collectUrl??'',
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
                errorWidget: (context, url, error) {
                  print('$url // $error');
                  return Text('이미지가 없습니다');
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('이미지 업로드'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('취소')),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('수정'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
