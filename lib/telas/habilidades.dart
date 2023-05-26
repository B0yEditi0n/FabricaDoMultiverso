import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../backend/habilidadesScript.dart';
import 'dart:core';

// aproveitamento de Código
import './widgetConstutor.dart';


class habilidadesTela extends StatefulWidget {
  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();  
}

class _habilidadesTelaState extends State<habilidadesTela> {   
  //Valores de Habilidade
  var forca     = HabilidadeValor(0, 0);
  int vlForca   = 0;

  var vigor     = HabilidadeValor(0, 0);
  int vlVigor   = 0;

  var destreza  = HabilidadeValor(0, 0);
  var vlDestreza  = 0;

  var agilidade = HabilidadeValor(0, 0);
  var vlAgilidade = 0;

  var luta      = HabilidadeValor(0, 0);
  var vlLuta    = 0;

  var intelcto  = HabilidadeValor(0, 0);
  int vlIntelcto  = 0;

  var prontidao = HabilidadeValor(0, 0); 
  int vlProntidao = 0;

  var presenca  = HabilidadeValor(0, 0); 
  int vlPresenca = 0;
  
  
  var reBuild = widgetConstrutor();
  // Função para Atualizar Valor do Widget
  void updateValor(String id, newValor){
    // pega o titulo chamado e exibe 3 primeiras letras
    // e convete elas para lower case
    //print(id.substring(0, 3).toLowerCase());
    setState(()=>
    habilidadeCaixa
    );
    setState(() {
      
      switch (id.substring(0, 3).toLowerCase()){
        
        case 'for':
          print(newValor);
          //forca.bonus = newValor;
          vlForca = newValor;
          break;
        case 'vig':
          vlVigor = newValor;
          break;
        case 'des':
          vlDestreza = newValor;
          break;
        case 'agi':
          vlAgilidade = newValor;
          break;
        case 'lut':
          vlLuta = newValor;
          break;
        case 'int':
          vlIntelcto = newValor;
          break; 
        case 'pro':
          vlProntidao = newValor;
          break; 
        case 'pre':
          vlPresenca = newValor;
          break;        
      }
    });    
  }

  @override  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),  
      appBar: AppBar(
        title: const Text('Habilidades'),
      ),
      drawer: reBuild.barraLatera(context), 
      
      body: 
      SingleChildScrollView(
          child: Container(
            width: double.infinity,        
            child: Align(
              alignment: const Alignment(0, 0),
              child: Column(                     
                children: <Widget> [       
                  habilidadeCaixa(context, 'Força', forca.bonus, vlForca ),
                  habilidadeCaixa(context, 'Vigor', vigor.bonus, vlVigor ),
                  habilidadeCaixa(context, 'Destreza', destreza.bonus, vlDestreza ),
                  habilidadeCaixa(context, 'Agilidade', agilidade.bonus, vlAgilidade),
                  habilidadeCaixa(context, 'Luta', luta.bonus, vlLuta),
                  habilidadeCaixa(context, 'Intelecto', intelcto.bonus, vlIntelcto),
                  habilidadeCaixa(context, 'Prontidão', prontidao.bonus, vlProntidao),
                  habilidadeCaixa(context, 'Presença', presenca.bonus, vlPresenca),
                ],
              ),
            ) 
          ),
    // ]
    )
    );
  }

  Widget habilidadeCaixa(context,String titulo, int bonus, int total) {     

    //return StatefulBuilder(builder: (context, setState,) {
    return  (
      Padding(
      padding: const EdgeInsets.only(top: 15),
      child: (
        Stack(
          children: [       
            // Caixa de Habilidade   
            Align(
              child: Container(
                // Tamanho e Proporção                  
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 15),                  
                width: 200,
                height: 100,
                                          
                // Decoração
                decoration: BoxDecoration(                    
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
                                popUpNumberPicker(context, titulo, bonus),
                                
                              },
                              child: Text(total.toString())
                            )
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
            Align( child:
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
                    fontSize: 16,
                    color: Colors.white,                     
                    ),
                  ),
                ),
              ),
            ),
            //  Fim; Barra de Titulo
          ],
        )
    
      ),
      )
    );
    //}
    //);
  }
  Future<void> popUpNumberPicker(BuildContext contexto, String titulo, int valor)async {
    return showDialog(
    context: contexto,
    barrierDismissible: false,
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
              updateValor(titulo, valor);
              Navigator.of(context).pop();
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
// https://stackoverflow.com/questions/50430273/how-to-set-state-from-another-widget
