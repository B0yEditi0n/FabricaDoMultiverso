import 'package:flutter/material.dart';
import 'widgets/bibliotecaFuncao.dart';

class defesaPage extends StatefulWidget {
  //const defesaPage({super.key});

  @override
  State<defesaPage> createState() => _defesaPageState();
}

class _defesaPageState extends State<defesaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),
      appBar: barraDeTitulo('Defesas'),
      drawer: barraLateral(),
      body: Center(
        
      )
    );
  }
}