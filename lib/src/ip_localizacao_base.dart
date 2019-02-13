import 'package:http/http.dart' as http;
import 'dart:convert';

class ip_externo {
  String _URLBase = 'https://ipinfo.io/%/json';

  String _LastIP;

  // variables return
  String _return01, _return02, _return03, _return04, _return05, _return06, _return07, _return08;

  int _Response;

  String _Body;

  ip_localizacao() {
    clear();

    _LastIP = null;

    _Body = null;

    _Response = null;
  }

  void clear() {
    _return01 = null;
    _return02 = null;
    _return03 = null;
    _return04 = null;
    _return05 = null;
    _return06 = null;
    _return07 = null;
    _return08 = null;
  }

  Future ReadIP(String IP) async {
    _LastIP = IP;

    var response = await http.get(_URLBase.replaceAll('%',IP));

    _Response = response.statusCode;
    _Body = response.body;

    if (_Response != 200)
      clear();
    else {
      Map<String, dynamic> IPDate = jsonDecode(_Body);

      _return01 = IPDate['ip'];
      _return02 = IPDate['hostname'];
      _return03 = IPDate['city'];
      _return04 = IPDate['region'];
      _return05 = IPDate['country'];
      _return06 = IPDate['loc'];
      _return07 = IPDate['postal'];
      _return08 = IPDate['org'];

    }
  }

  String getIP() {
    return _return01;
  }

  String getHostname() {
    return _return02;
  }

  String getCity() {
    return _return03;
  }

  String getRegion() {
    return _return04;
  }

  String getCountry() {
    return _return05;
  }

  String getCoordinates() {
    return _return06;
  }

  String getPostal() {
    return _return07;
  }

  String getOrg() {
    return _return08;
  }

  int getResponse() {
    return _Response;
  }

  String getBody() {
    return _Body;
  }
}