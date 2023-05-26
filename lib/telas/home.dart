import 'package:flutter/material.dart';

import '../backend/homeScript.dart';
import './widgetConstutor.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homeTela();
}

class homeTela extends State<homePage>{
  var clhome = homeBuild();
  var reBuild = widgetConstrutor();
  @override
  Widget build(BuildContext context){
    clhome.inicializacao(context);
    //Inicialização da Calsse 
    
    //clhome.inicializacao(context);
    return Scaffold(    
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),  
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),

      drawer: reBuild.barraLatera(context),

      body: Center(        
        child: Column(          
          children: <Widget> [
            clhome.wdgButton('Habilidades', '/habilidadesTela'),
            clhome.wdgButton('Defesas', '/defesasTela'),
            clhome.wdgButton('Vantagens', ''),
            clhome.wdgButton('Poderes', '/poderesTela'),
            clhome.wdgButton('Pericias', ''),
            clhome.wdgButton('Complicações', ''),
          ],
        )    
      ),
    );
  }


}


// Aproveitamento de Código

class homeBuild {

  var contexto;

  inicializacao(context){
    // return (Navigator.pushReplacementNamed(context, '/loginTela'));  
    contexto = context;
  }

  wdgButton(String txtTitle, String rotaTela){
    return ( 
      Container(
        child:
        Padding(
          padding: const EdgeInsets.fromLTRB(0,15,0,0),
          child: SizedBox(   
            width: 6000,       
            height: 30,
            
            //style: BoxDecoration(color:
            child:
              TextButton(       
                style: const ButtonStyle(               
                ),
                child: 
                Text(
                  style: const TextStyle(
                    fontFamily: 'Anton',
                    color: Colors.white,                      
                  ),//wdgButtonStyle(),
                  txtTitle
                  ),
                onPressed: (){
                  Navigator.popAndPushNamed(contexto, rotaTela);

                },
              ),
          ),
        ),      
      )
    );
  }
}