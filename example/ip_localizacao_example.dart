import 'package:ip_localizacao/ip_localizacao.dart' as ip_localizacao;

main() async {
  var IP = new ip_localizacao.ip_localizacao();

  var result = await IP.ReadIP('179.211.111.1011');

  // Sucesso
  if (IP.getResponse() == 200) {
    print('IP: '+IP.getIP());
    print('Hostname: '+IP.getHostname());
    print('Cidade: '+IP.getCity());
    print('Região/Estado: '+IP.getRegion());
    print('País: '+IP.getCountry());
    print('País (Sigla 2): '+IP.getCountry2());
    print('País (Sigla 3): '+IP.getCountry3());
    print('Coordenadas: '+IP.getCoordinates());
    print('Código Postal: '+IP.getPostal());
    print('Provedor: '+IP.getOrg());
  } else {
    print('Código de Retorno: '+IP.getResponse().toString());
    print('Erro: '+IP.getBody());
  }
}