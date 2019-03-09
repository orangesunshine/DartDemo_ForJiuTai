import 'package:flutter/material.dart';
import 'package:flutter_jiutai/widget/vip_manager.dart';
import 'package:flutter_jiutai/widget/team_report.dart';
import 'package:flutter_jiutai/constance/constance.dart';

void main() {
  runApp(new MaterialApp(
    home: new Main(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => VipManagerWidget(),
      '/b': (BuildContext context) => TeamReportWidget(),
    },
  ));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            color: Colores.gray_white,
            child: Text("会员管理"),
            onPressed: () => Navigator.of(context).pushNamed('/a'),
          ),
          RaisedButton(
            color: Colores.gray_white,
            child: Text("团队统计日报表"),
            onPressed: () => Navigator.of(context).pushNamed('/b'),
          ),
          RaisedButton(
            color: Colores.gray_white,
            child: Text("团队盈亏"),
            onPressed: () => Navigator.of(context).pushNamed('/c'),
          ),
          RaisedButton(
            color: Colores.gray_white,
            child: Text("注册链接"),
            onPressed: () => Navigator.of(context).pushNamed('/d'),
          )
        ],
      ),
    );
  }
}
