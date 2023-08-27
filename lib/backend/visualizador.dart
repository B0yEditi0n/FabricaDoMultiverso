import 'package:fabrica_do_multiverso/backend/alterador.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';       // responsável pelo import
import 'dart:convert';  // Convesão do Json

class Visualizador extends Alterador{
  Visualizador(){
    // 
  }
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  Future<File> get _localFile async {
    // final path = await _localPath;
    return File('/home/caio/Documentos/RPG/conversão de ficha/AplicativoDeFichas/FabricaDoMultiverso/lib/backend/_tmp/ficha.json');
  }

  Future<String> readCounter() async {
    try {
      final file = await this._localFile;

      // Read the file
      final contents = await file.readAsString();

      // print(contents);
      print(contents);
      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      print(e);
      return '';

    }
  }

  addNewWidgetPower(){
    print(readCounter());
  }
}