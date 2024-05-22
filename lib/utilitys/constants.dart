import 'package:flutter/material.dart';
import 'colors.dart';

enum CardType {
  EMPTY,
  TASK,
  MAP,
  DONE,
}

enum UseCase {
  EMPTY,
  SUCCESS,
  FAIL,
  FAILEMPTY,
}

const TextStyle cAppbarTitle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: KColors.black);
const TextStyle cHeaderTextStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: KColors.black);
const TextStyle cLabelTextStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: KColors.black);
const TextStyle cContentTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: KColors.black);
const TextStyle cBtnTextStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: KColors.white);
const TextStyle cTagTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: KColors.white);

 ButtonStyle bigBtn = ElevatedButton.styleFrom(

 );
const SizedBox cBigH = SizedBox(
  height: 30,
);
const SizedBox cBigW = SizedBox(
  width: 30,
);
const SizedBox cNorH = SizedBox(
  height: 20,
);
const SizedBox cNorW = SizedBox(
  width: 20,
);
const SizedBox cSmH = SizedBox(
  height: 10,
);
const SizedBox cSmW = SizedBox(
  width: 10,
);

const mainPadding = EdgeInsets.fromLTRB(20, 20, 20, 20);

const double BIGGAP = 40;
const double NORMALGAP = 20;
const double SMALLGAP = 10;

const double BUTTONHEIGHT = 70;
const double BIGRADIUS = 15;
const double SMALLRADIUS = 8;
