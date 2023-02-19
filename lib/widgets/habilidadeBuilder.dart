import 'package:flutter/material.dart';

class HabilidadeBuilder {
  habilidadeCaixa(String titulo, String bonus, String total){
    return(
      Padding(
      padding: EdgeInsets.only(top: 15),
      child: (
        Stack(
          children: [               
            // Caixa de Habilidade          
            Align(
              // child: Positioned(
                child: Container(                       
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
    
                  child: Column(children: [
    
                    Center(                                
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [                                    
                              Container(
                                child: Column(
                                  children: [
                                    const Text('Bônus'),
                                    Text(bonus)
                                  ]                              
                                ),
                              ),                                 
                              // Espaço em Branco
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  const Text('Valor Total'),
                                  Text(total)
                                ],
                              ),
                            
                          ]
                        ),
                      ),
                    ),      
    
                  ],),
                  
                ),
              // ),
            ),
            //FIM: Caixa de Habilidade
    
            //  Barra de Titulo
            Align(
              // child: Positioned(
                // top: 0,                    
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
            //  Barra de Titulo
          ],
        )
    
      ),
      )
    );
  }
}