import 'package:flutter/material.dart';

class AppState {
  double slider;

  bool bold;
  bool italic;
  double backGroundColor_r;
  double backGroundColor_g;
  double backGroundColor_b;

  AppState(
      {@required this.slider,
      this.backGroundColor_r,
      this.backGroundColor_g,
      this.backGroundColor_b,
      this.bold = false,
      this.italic = false});

  AppState.copyWith(AppState another) {
    slider = another.slider;
    bold = another.bold;
    italic = another.italic;
    backGroundColor_r = another.backGroundColor_r;
    backGroundColor_g = another.backGroundColor_g;
    backGroundColor_b = another.backGroundColor_b;
  }
  double get getBackgroundColor_r => backGroundColor_r * 124;
  double get getBackgroundColor_g => backGroundColor_g * 125;
  double get getBackgroundColor_b => backGroundColor_b * 126;
  double get getViewFontSize => slider * 30;
}
