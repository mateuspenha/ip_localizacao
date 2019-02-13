import 'package:http/http.dart' as http;

class ip_externo {
  String _URLBase = 'http://checkip.dyndns.org/';

  String _IP;

  int _Response;

  String _Body;

  ip_externo() {
    _IP = '';
  }

  Future ReadIP() async {
    var response = await http.get(_URLBase);

    _Response = response.statusCode;
    _Body = response.body;

    if (_Response != 200)
      _IP = '';
    else {
      int position_01 = _Body.indexOf('<body>')+6;

      int position_02 = _Body.indexOf('</body>');

      _IP = _Body.substring(position_01,position_02).trim();

      _IP = _IP.replaceAll('Current IP Address:', '').trim();
    }
  }

  String getIP() {
    return _IP;
  }

  int getResponse() {
    return _Response;
  }

  String getBody() {
    return _Body;
  }
}