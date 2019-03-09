import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter_jiutai/constance/constance.dart';
import 'package:flutter_jiutai/utils/common_view.dart';

class TeamReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home(
        Column(
          children: <Widget>[
            TimeSelection(),
            Container(
              color: Colores.bg_light_black,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextView.whitebig("盈亏金额(元)"),
                    ),
                    TextView("82335.63", 36, TextColor.text_gold),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TeamReportListView(loadTeamReportData()),
            )
          ],
        ),
        PAGE_VIP_MANAGER);
  }
}

class TeamReportListView extends StatelessWidget {
  List<TeamReportBean> _datas = loadTeamReportData();

  TeamReportListView(this._datas);

  @override
  Widget build(BuildContext context) {
    return (null == _datas || _datas.isEmpty)
        ? Center(
            child: Text("no data"),
          )
        : ListView.builder(
            itemCount: _datas.length,
            itemBuilder: (context, index) => TeamReportItem(_datas[index]));
  }
}

class TeamReportItem extends StatelessWidget {
  TeamReportBean _bean;

  TeamReportItem(this._bean);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colores.bg_dark_black,
      child: Card(
          color: Colores.bg_light_black,
          margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 5),
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: _bean._roleType == ROLE_AGENT
                                          ? Color(0xff0F87FE)
                                          : Color(0xffFF7254)),
                                  child: TextView.whitesmall(
                                      _bean.roleType == ROLE_AGENT
                                          ? "代理"
                                          : "会员"),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextView.whitebig(_bean.username),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextView(_bean.notecount.toString() + "注",
                              TextSize.normal, TextColor.text_gold),
                        ),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: TextView("+" + _bean.profitloss + "元",
                            TextSize.normal, TextColor.text_orange),
                      )),
                    ],
                  ),
                ),
                Divider(
                  height: 2.0,
                  indent: 0.5,
                  color: Colores.divider,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              TextView.graybig("彩票投注"),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: TextView.whitebig(_bean.lottery),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              TextView.graybig("中奖"),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: TextView.whitebig(_bean.win),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              TextView.graybig("返点"),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: TextView.whitebig(_bean.rebate),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

List<TeamReportBean> loadTeamReportData() {
  List<TeamReportBean> list = List();
  for (int i = 0; i < 20; i++) {
    int roleType = i % 2 == 0 ? ROLE_AGENT : ROLE_VIP;
    list.add(new TeamReportBean(
        (Random().nextDouble() * 1000).toStringAsFixed(2),
        (Random().nextDouble() * 1000).toStringAsFixed(2),
        (Random().nextDouble() * 1000).toStringAsFixed(2),
        (Random().nextDouble() * 1000).toStringAsFixed(2),
        roleType,
        Random().nextInt(1000),
        "用户$i"));
  }
  return list;
}

class TeamReportBean {
  String _profitloss, _lottery, _win, _rebate;
  int _roleType, _notecount;
  String _username;

  TeamReportBean(this._profitloss, this._lottery, this._win, this._rebate,
      this._roleType, this._notecount, this._username);

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  get notecount => _notecount;

  set notecount(value) {
    _notecount = value;
  }

  int get roleType => _roleType;

  set roleType(int value) {
    _roleType = value;
  }

  get rebate => _rebate;

  set rebate(value) {
    _rebate = value;
  }

  get win => _win;

  set win(value) {
    _win = value;
  }

  get lottery => _lottery;

  set lottery(value) {
    _lottery = value;
  }

  get profitloss => _profitloss;

  set profitloss(value) {
    _profitloss = value;
  }

  @override
  String toString() {
    return 'TeamReportBean{_profitloss: $_profitloss, _lottery: $_lottery, _win: $_win, _rebate: $_rebate, _roleType: $_roleType, _notecount: $_notecount, _username: $_username}';
  }
}
