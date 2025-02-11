


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:poyecto2/repository/gatos/entidades/gato.dart';



Future<Gato> getGatitos() async {
  await dotenv.load(fileName: "assets/env/.env"); 

  var url = Uri.parse(dotenv.env['URL']!);

  var response = await http.get(url);
  if (response.statusCode ==200){
  //  final data = json.decode(response.body);
  //  List<dynamic> lista = data['data'];
    return gatoFromJson(response.body);
  } else {
    throw Exception('error al cargar gatitos');
  }

}