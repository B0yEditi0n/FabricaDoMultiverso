import 'package:flutter/material.dart';

class homeScript {
  
  inicializacao(context){
    // return (Navigator.pushReplacementNamed(context, '/loginTela'));  
  }
  wdgButtonStyle(){
      
      
      
  }
  wdgButton(String txtTitle){
    return( 
      Container(
        child:
        Padding(
          padding: const EdgeInsets.fromLTRB(0,15,0,0),
          child: SizedBox(
            child: 
              TextButton(
                style: const ButtonStyle(),
                child: 
                Text(
                  style: const TextStyle(
                    fontFamily: 'Anton',
                    ),//wdgButtonStyle(),
                  txtTitle
                  ),
                onPressed: (){

                },
                ),              
            
          ),
        ),      
      )
    );
  }
}