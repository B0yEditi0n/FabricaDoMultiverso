import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import './backend/habilidadesScript.dart';
import 'dart:core';



class habilidadesTela extends StatefulWidget {
  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();  
}

class _habilidadesTelaState extends State<habilidadesTela> {   
  //Valores de Habilidade
  var forca     = HabilidadeValor(0, 0);
  var vigor     = HabilidadeValor(0, 0);
  var destreza  = HabilidadeValor(0, 0);
  var agilidade = HabilidadeValor(0, 0);
  var luta      = HabilidadeValor(0, 0);
  var intelcto  = HabilidadeValor(0, 0);
  var prontidao = HabilidadeValor(0, 0); 
  var presenca  = HabilidadeValor(0, 0); 
  
  
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
          break;
        case 'vig':
          vigor.bonus = newValor;
          break;
        case 'des':
          destreza.bonus = newValor;
          break;
        case 'agi':
          agilidade.bonus = newValor;
          break;
        case 'lut':
          luta.bonus = newValor;
          break;
        case 'int':
          intelcto.bonus = newValor;
          break; 
        case 'pro':
          prontidao.bonus = newValor;
          break; 
        case 'pre':
          presenca.bonus = newValor;
          break;        
      }
    });    
  }

  @override  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(30, 30, 30, 92),  
      appBar: AppBar(
        title: const Text('Menu Principal'),
        ),
      drawer: Container(
        color: const Color.fromARGB(255, 13, 14, 92),
        child: 
          const Text(
            'Titulo', 
            selectionColor: Colors.white,
            )
        ),
      body: 
      SingleChildScrollView(
          child: Container(
            width: double.infinity,        
            child: Align(
              alignment: const Alignment(0, 0),
              child: Column(                     
                children: <Widget> [       
                  habilidadeCaixa(context, 'Força', forca.bonus, forca.valor ),
                  habilidadeCaixa(context, 'Vigor', vigor.bonus, vigor.valor ),
                  habilidadeCaixa(context, 'Destreza', destreza.bonus, destreza.valor ),
                  habilidadeCaixa(context, 'Agilidade', agilidade.bonus, agilidade.valor),
                  habilidadeCaixa(context, 'Luta', luta.bonus, luta.valor),
                  habilidadeCaixa(context, 'Intelecto', luta.bonus, luta.valor),
                  habilidadeCaixa(context, 'Prontidão', prontidao.bonus, prontidao.valor),
                  habilidadeCaixa(context, 'Presença', presenca.bonus, presenca.valor),
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