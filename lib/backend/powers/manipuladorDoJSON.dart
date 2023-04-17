import 'dart:async';
// import 'package:flutter/widgets.dart';
// import ' dart:';
// import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

class JSONManipulacao{
  


}
void main() async{
  // Uri uri = Uri.https('file:///home/caio/Documentos/RPG/convers%C3%A3o%20de%20ficha/AplicativoDeFichas/fabrica_do_multiverso/Documentos/Modelo.json');
  // final future = http.get(uri);
  // future.then((value){
  //   if(value.statusCode == 200){
  //     print('object');
  //   }
  // });
  // var objeto = JSONManipulacao();
  // print(objeto.uri);
  final appDocumentsDir = await getApplicationDocumentsDirectory();
  print(appDocumentsDir);
}



