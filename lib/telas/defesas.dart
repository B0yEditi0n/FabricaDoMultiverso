import 'package:flutter/material.dart';
import '../widgets/bibliotecaFuncao.dart';

//Rebuild
import './widgetConstutor.dart';


class defesaPage extends StatefulWidget {
  //const defesaPage({super.key});

  @override
  State<defesaPage> createState() => _defesaPageState();
}

class _defesaPageState extends State<defesaPage> {
  var reBuild = widgetConstrutor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),
      appBar: AppBar(
        title: const Text('Defesas'),
      ),

      drawer: reBuild.barraLatera(context),
      body: Center(
        
      )
    );
  }
}