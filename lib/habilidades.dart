import 'package:flutter/material.dart';
import 'widgets/habilidadeBuilder.dart';

class habilidadesTela extends StatefulWidget {
  // const habilidadesTela({super.key});
  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();
}

class _habilidadesTelaState extends State<habilidadesTela> {
  var buildHanilidade = new HabilidadeBuilder();
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
      body: Container(
        width: double.infinity,        

        alignment: Alignment.center,

        // color: Color.fromARGB(255, 255, 0, 0),
        
        child: Align(
          
          alignment: const Alignment(0, 0),
          
          child: Column(                     
            
            children: <Widget> [
              buildHanilidade.habilidadeCaixa('Força', '10', '10'),
              buildHanilidade.habilidadeCaixa('Vigor', '10', '10'),
              buildHanilidade.habilidadeCaixa('Agilidade', '10', '10'),
              buildHanilidade.habilidadeCaixa('Destreza', '10', '10'),              
              buildHanilidade.habilidadeCaixa('Luta', '10', '10'),
              buildHanilidade.habilidadeCaixa('Intelecto', '10', '10'),
              buildHanilidade.habilidadeCaixa('Prontidão', '10', '10'),
              buildHanilidade.habilidadeCaixa('Presença', '10', '10'),
              // Widget de Habilidade
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 30),
              //     child: Stack(
              //       children: [       
              //         // Caixa de Habilidade
              //         Align(
              //           child: Positioned(
              //             child: Container(                            
              //               // Tamanho e Proporção
              //               alignment: Alignment.center,
              //               margin: const EdgeInsets.only(top: 15),
              //               width: 200,
              //               height: 100,
                                                      
              //               // Decoração
              //               decoration: BoxDecoration(
              //                 // color: Colors.white,
              //                 // border: Border.all(color: Colors.black),
              //                 border: Border.all(
              //                   color: Colors.black,
              //                   width: 5,
              //                   style: BorderStyle.solid
              //                 ),
              
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              
              //               child: Column(children: [
              
              //                 Center(                                
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(top: 13),
              //                     child: Row(                        
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [                                    
              //                           Container(
              //                             child: Column(
              //                               children: [
              //                                 Text('Bônus'),
              //                                 Text('10')
              //                               ]                              
              //                             ),
              //                           ),                                 
              //                           // Espaço em Branco
              //                           const SizedBox(
              //                             width: 15,
              //                           ),
              //                           Column(
              //                             children: [
              //                               Text('Valor Total'),
              //                               Text('10')
              //                             ],
              //                           ),
                                      
              //                       ]
              //                     ),
              //                   ),
              //                 ),      
              
              //               ],),
                           
              //             ),
              //           ),
              //         ),
              //         //FIM: Caixa de Habilidade
                      
              //         //  Barra de Titulo
              //         Align(
              //           child: Positioned(
              //             top: 0,                    
              //             child:
              //             Container(                        
              //               decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 border: Border.all(color: Colors.black),
              //               ),
              //               child: const Padding(
              //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              //                 child: Text('Força',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   //fontWeight: FontWeight.bold,
              //                   fontSize: 16,
              //                   color: Colors.white,                     
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         //  Barra de Titulo
                      
                      
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ) 
      ),
    );
  }
}