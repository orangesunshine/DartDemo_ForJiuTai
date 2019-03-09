import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jiutai/constance/constance.dart';
import 'package:flutter_jiutai/utils/utils.dart';

class TimeSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimeSelectionState();
  }
}

class _TimeSelectionState extends State<TimeSelection> {
  String _from, _to;

  @override
  void initState() {
    super.initState();
    _from = "2018-10-15";
    _to = "2018-11-15";
  }

  String get from => _from;

  set from(String value) {
    setState(() {
      _from = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colores.bg_light_black,
      child: Center(
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("从 $_from",
                      style: TextStyle(color: TextColor.text_gray_white)),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colores.gray_white,
                )
              ],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("到 $_to",
                      style: TextStyle(color: TextColor.text_gray_white)),
                ),
                Icon(Icons.arrow_drop_down, color: TextColor.text_gray_white)
              ],
            ),
            Expanded(
              child: Align(
                child: TextView.graynormal("自定义"),
                alignment: Alignment.centerRight,
              ),
            )
          ],
        ),
      ),
    );
  }

  get to => _to;

  set to(value) {
    setState(() {
      _to = value;
    });
  }
}

class Home extends StatelessWidget {
  Widget _body;
  int _page;

  Home(this._body, this._page);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      home: new Scaffold(
        appBar: MyAppBar(
            context, getTitle(context, _page), getAction(context, _page)),
        body: _body,
      ),
    );
  }
}

class MyAppBar extends AppBar {
  BuildContext _context;
  String _title;
  List<Widget> _actions;

  MyAppBar(this._context, this._title, this._actions)
      : super(
          backgroundColor: Colores.bg_light_black,
          title: Text(
            _title,
            style: TextStyle(color: Colores.gold, fontSize: 20),
          ),
          leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            color: Colores.gold,
            onPressed: () {
              toastMsg("BACK");
              Navigator.of(_context).pop();
            },
          ),
          actions: _actions,
        );
}

//根据页面类型pageType，获取菜单功能
List<Widget> getAction(BuildContext context, int pageType) {
  List<Widget> actions = List();
  if (pageType == PAGE_VIP_MANAGER) {
    actions.add(IconButton(
      icon: const Icon(Icons.add),
      color: Colores.white,
      tooltip: 'Add',
      onPressed: () {
        toastMsg("Add");
        Navigator.of(context).pushNamed('/a');
      },
    ));
    actions.add(IconButton(
      icon: const Icon(Icons.search),
      color: Colores.white,
      tooltip: 'Search',
      onPressed: () {
        toastMsg("Search");
        Navigator.of(context).pushNamed('/b');
      },
    ));
  } else if (pageType == PAGE_REGISTER_LINK) {
    actions.add(IconButton(
      icon: const Icon(Icons.add),
      color: Colores.white,
      tooltip: 'Add',
      onPressed: () {
        toastMsg("Add");
      },
    ));
  }
  return actions;
}

//根据页面类型pageType，获取标题
String getTitle(BuildContext context, int pageType) {
  String title = "会员管理";
  switch (pageType) {
    case PAGE_VIP_MANAGER:
      title = "会员管理";
      break;
    case PAGE_TEAM_REPORT:
      title = "团队统计日报表";
      break;
    case PAGE_TEAM_PROFIT_LOSS:
      title = "团队盈亏";
      break;
    case PAGE_REGISTER_LINK:
      title = "注册链接";
      break;
  }
  return title;
}

class TextView extends Text {
  TextView(String data, double size, Color color)
      : super(data, style: TextStyle(color: color, fontSize: size));

  TextView.whitebig(String data)
      : this(data, TextSize.big, TextColor.text_white);

  TextView.whitenormal(String data)
      : this(data, TextSize.normal, TextColor.text_white);

  TextView.whitesmall(String data)
      : this(data, TextSize.small, TextColor.text_white);

  TextView.graybig(String data)
      : this(data, TextSize.big, TextColor.text_gray_white);

  TextView.graynormal(String data)
      : this(data, TextSize.normal, TextColor.text_gray_white);

  TextView.graysmall(String data)
      : this(data, TextSize.small, TextColor.text_gray_white);
}
