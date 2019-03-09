import 'package:flutter/material.dart';

const int PAGE_VIP_MANAGER = 1; //会员管理
const int PAGE_TEAM_REPORT = 2; //团队统计日报表
const int PAGE_TEAM_PROFIT_LOSS = 3; //团队盈亏
const int PAGE_REGISTER_LINK = 4; //注册链接
const int ROLE_AGENT = 1;
const int ROLE_VIP = 2;

class Colores {
  static final Color light_gray = const Color(0xff999999); //16进制的ARGB
  static final Color black = const Color(0xff000000); //16进制的ARGB
  static final Color bg_light_black = const Color(0xff212129); //16进制的ARGB
  static final Color bg_dark_black = const Color(0xff101015); //16进制的ARGB
  static final Color red = const Color(0xffff0000); //16进制的ARGB
  static final Color gold = const Color(0xffeed3a6); //16进制的ARGB
  static final Color white = const Color(0xffffffff); //16进制的ARGB
  static final Color gray_white = const Color(0xff989898);
  static final Color orange = const Color(0xffFF7254);
  static final Color divider = const Color(0xff27272F);
}

class TextColor {
  static final Color text_white = const Color(0xffffffff); //16进制的ARGB
  static final Color text_gray_white = const Color(0xff989898); //16进制的ARGB
  static final Color text_orange = const Color(0xffEC6A50);
  static final Color text_gold = const Color(0xffCCA560);
}

class TextSize {
  static final double title = 18;
  static final double big = 16;
  static final double normal = 14;
  static final double small = 12;
}
