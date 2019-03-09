import 'package:flutter_jiutai/constance/constance.dart';

class VipManagerBean {
  String _agent, _userName, _balance, _dateTime;
  bool _state;
  int _roleType = ROLE_AGENT;

  VipManagerBean(this._agent, this._userName, this._state, this._roleType,
      this._balance, this._dateTime);

  get dateTime => _dateTime;

  set dateTime(value) {
    _dateTime = value;
  }

  get balance => _balance;

  set balance(value) {
    _balance = value;
  }

  get roleType => _roleType;

  set roleType(value) {
    _roleType = value;
  }

  get state => _state;

  set state(value) {
    _state = value;
  }

  get userName => _userName;

  set userName(value) {
    _userName = value;
  }

  String get agent => _agent;

  set agent(String value) {
    _agent = value;
  }

  @override
  String toString() {
    return 'VipManagerBean{_agent: $_agent, _userName: $_userName, _state: $_state, _roleType: $_roleType, _balance: $_balance, _dateTime: $_dateTime}';
  }
}
