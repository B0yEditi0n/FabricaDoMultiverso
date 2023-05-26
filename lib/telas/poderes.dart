import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';       // responsável pelo import
import 'dart:convert';  // Convesão do Json

class poderesPage extends StatefulWidget {
  const poderesPage({super.key});

  @override
  State<poderesPage> createState() => _poderesPageState();
}


class _poderesPageState extends State<poderesPage> {
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }
  Future<File> get _localFile async {
    // final path = await _localPath;
    return File('/home/caio/Documentos/RPG/conversão de ficha/AplicativoDeFichas/fabrica_do_multiverso/Documentos/Modelo.json');
  }
  
  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      // print(contents);

      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    
    // print(appDocumentsDir);
    return Scaffold(
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),  
      appBar: AppBar(
        title: const Text('Poderes'),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: 
            TextButton(
              child: const Text('TextButton'),
              // style: ButtonStyle(
              // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              // ),
              onPressed: () async {
                // print(await readCounter());
                var jsonSTR = await readCounter();
                final Map<String, dynamic> objs = json.decode(jsonSTR.toString());
                print(objs['powers'][0]['powers'][0]['rank']);
               },              
            )
          ),
        
      ),
    );
  }
}