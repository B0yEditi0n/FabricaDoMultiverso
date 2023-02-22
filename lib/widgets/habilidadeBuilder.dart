
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:numberpicker/numberpicker.dart';
import '../habilidades.dart';

StreamController<int> streamController = StreamController<int>();

class HabilidadeBuilder{  

  var referenc = passParamet();   

  Widget  habilidadeCaixa(context, String titulo,  int bonus, int total){   
    final Stream<int> stream; 

    return StatefulBuilder(builder: (context, setState) {
      void initState(){
        // super.initState();
        // widget.stram.listen((index){
        //   setStateValor('')
        //   setStateValor()
        // })
      }
      void setStateValor(String tipo, int newValor){
        if(tipo == 'B' || tipo == 'b'){
          setState(){
            bonus = newValor;
          }  
        }
        else if(tipo == 'T' || tipo == 't'){
          setState(){
            total = newValor;
          }
        }        
        
        
      }
    return(
      Padding(
      padding: const EdgeInsets.only(top: 15),
      child: (
        Stack(
          children: [               
            // Caixa de Habilidade          
            Align(
              child: Container( // Estilização da Borda Preta        
                // Tamanho e Proporção                  
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 15),                  
                width: 200,
                height: 100,
                                          
                // Decoração
                decoration: BoxDecoration(                    
                  // color: Colors.white,
                  // border: Border.all(color: Colors.black),
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                    style: BorderStyle.solid
                  ),
  
                  borderRadius: BorderRadius.circular(10),
                ),
  
                child: Column(                  
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Row(                        
                      mainAxisAlignment: MainAxisAlignment.spaceAround,          
                      children: [                                    
                        Container(                          
                          child: Column(
                            children: const [
                              Text('Bônus'),
                              //Text(bonus)
                            ]                              
                          ),
                        ),                                 
                        Column(
                          children: [
                            const Text('Valor Total'),
                            TextButton(
                              onPressed: () => {                                
                                                                
                                this.popUpNumberPicker(context, titulo, total),
                                // total = await referenc.thisValue(),
                                print (total),
                                this.referenc.paramet
                                
                              },
                              child: Text(total.toString())
                            )
                            //Text(total)
                          ],
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ),
            //FIM: Caixa de Habilidade
    
            //  Barra de Titulo
            Align(            
                child:
                Container(                        
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(titulo,
                    textAlign: TextAlign.center,
                    style:const  TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,                     
                      ),
                    ),
                  ),
                ),
              // ),
            ),
            //  Fim; Barra de Titulo
          ],
        )
    
      ),
      )
    );
    });
  }

  Future<void> popUpNumberPicker(BuildContext contexto, String titulo, int valor)async {
    
    // int valueHability = AtualN;
    //var currentValue = 0;
    return showDialog(
    context: contexto,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {   
      return AlertDialog(
        title: Text('Valor de $titulo'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              NumberPicker(              
                value: valor,
                minValue: 0,
                maxValue: 50,
                onChanged: (value) => setState(() => valor = value),            
              
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
              // streamController.add('T', valor);
              

            },
          ),
        ],
      );
    },
    );
    }
  );
  }
  
}

//######################################################################
//  Utilidade de Classes
//######################################################################

class passParamet{
  var paramet;

  setValor(newValue)async{
    this.paramet = newValue;
  }
  thisValue()async{
    return this.paramet;
  }

}

// class buildPopupsUtily extends State<habilidadesTela>  {
//   @override
//   return()
// }