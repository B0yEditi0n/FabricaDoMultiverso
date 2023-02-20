import 'package:flutter/material.dart';
import 'widgets/habilidadeBuilder.dart';

class habilidadesTela extends StatefulWidget {
  // const habilidadesTela({super.key});
  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();
}

class _habilidadesTelaState extends State<habilidadesTela> {
  var buildHanilidade = HabilidadeBuilder();
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
        // slivers: <Widget>[      
          child: Container(
            width: double.infinity,        
            // color: Color.fromARGB(255, 255, 0, 0),
            
            child: Align(
              
              alignment: const Alignment(0, 0),
              
              child: Column(                     
                
                children: <Widget> [
                  buildHanilidade.habilidadeCaixa(context, 'Força', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Vigor', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Agilidade', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Destreza', '10', '10'),              
                  buildHanilidade.habilidadeCaixa(context, 'Luta', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Intelecto', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Prontidão', '10', '10'),
                  buildHanilidade.habilidadeCaixa(context, 'Presença', '10', '10'),              
                ],
              ),
            ) 
          ),
    // ]
    )
    );
  }
}