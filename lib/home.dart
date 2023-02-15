import 'dart:io';

import 'package:flutter/material.dart';

import './backend/homeScript.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homeTela();
}

class homeTela extends State<homePage>{
  var clhome = homeScript();

  @override
  Widget build(BuildContext context){
    //Inicialização da Calsse 
    
    //clhome.inicializacao(context);
    return Scaffold(      
      appBar: AppBar(
        title: Text('Menu Principal'),
                    ),
      drawer: Container(color: Colors.red, ),
      body: Center(
        child: Column(
          children: <Widget> [
            clhome.wdgButton('Habilidades'),
            clhome.wdgButton('Defesas'),
            clhome.wdgButton('Vantagens'),
            clhome.wdgButton('Poderes'),
            clhome.wdgButton('Pericias'),
            clhome.wdgButton('Complicações'),
          ],
        )    
      ),
    );
  }


}
