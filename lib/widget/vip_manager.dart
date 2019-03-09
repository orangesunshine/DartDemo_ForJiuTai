import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_jiutai/bean/vip_manager.dart';
import 'package:flutter_jiutai/constance/constance.dart';
import 'package:flutter_jiutai/utils/common_view.dart';
import 'package:flutter_jiutai/utils/utils.dart';

List<VipManagerBean> loadVipManagerData() {
  List<VipManagerBean> list = List();
  String balance = (Random().nextDouble() * 10000).toStringAsFixed(2);
  DateTime now = new DateTime.now();
  for (int i = 0; i < 20; i++) {
    bool state = i % 2 == 0;
    int roleType = i % 2 == 0 ? ROLE_AGENT : ROLE_VIP;
    list.add(new VipManagerBean("agent0$i", "用户$i", state, roleType, balance,
        formatDate(now, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss])));
  }
  return list;
}

class VipManagerListView extends StatelessWidget {
  List<VipManagerBean> _datas = loadVipManagerData();

  VipManagerListView(this._datas);

  @override
  Widget build(BuildContext context) {
    return (null == _datas || _datas.isEmpty)
        ? Center(
            child: Text("no data"),
          )
        : ListView.builder(
            itemCount: _datas.length,
            itemBuilder: (context, index) => VipManagerItem(_datas[index]));
  }
}

class VipManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home(
        Column(
          children: <Widget>[
            TimeSelection(),
            Expanded(
              child: VipManagerListView(loadVipManagerData()),
            )
          ],
        ),
        PAGE_VIP_MANAGER);
  }
}

class VipManagerItem extends StatelessWidget {
  VipManagerBean _bean;

  VipManagerItem(this._bean);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toastMsg("$_bean"),
      child: Container(
          color: Colores.bg_dark_black,
          child: Card(
              color: Colores.bg_light_black,
              margin:
                  EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextView.whitebig(_bean.agent),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: TextView.whitebig(_bean.userName),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 5),
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color: _bean.state
                                        ? Color(0xffFF6545)
                                        : Color(0xffAAAAAA)),
                                child: TextView.whitesmall("在线"),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    _bean.roleType == ROLE_AGENT ? "代理" : "会员",
                                    style: TextStyle(
                                        color: _bean.roleType == ROLE_AGENT
                                            ? Color(0xff0E7B6C)
                                            : Color(0xffEB5F42)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 5),
                                    child: TextView.graysmall("余额"),
                                  ),
                                  Text(
                                    _bean.balance.toString(),
                                    style: TextStyle(color: Color(0xffEB5F42)),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextView.graysmall(_bean.dateTime),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colores.gray_white,
                    )
                  ],
                ),
              ))),
    );
  }
}
