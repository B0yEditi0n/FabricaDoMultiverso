import 'package:flutter/material.dart';

import './backend/homeScript.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homeTela();
}

class homeTela extends State<homePage>{
  var clhome = new homeScript();

  @override
  Widget build(BuildContext context){
    //Inicialização da Calsse 
    
    //clhome.inicializacao(context);
    return Scaffold(      
      appBar: AppBar(
        title: Text('Menu Principal'),
                    ),
      drawer: Container(color: Colors.red, ),
      
      body: Container(
        
      ),
    );
  }


}
