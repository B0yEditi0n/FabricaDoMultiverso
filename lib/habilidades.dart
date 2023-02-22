import 'package:flutter/material.dart';
import 'widgets/habilidadeBuilder.dart';

class habilidadesTela extends StatefulWidget {
  // const habilidadesTela({super.key});

  // habilidadesTela(this.stream);
  // final Stream<int> stream;

  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();  
}

class _habilidadesTelaState extends State<habilidadesTela> {
  var buildHabilidade = HabilidadeBuilder();
  
  @override
  // void initState() {
  //   super.initState()
  // }
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
                  buildHabilidade.habilidadeCaixa(context, 'Força', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Vigor', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Agilidade', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Destreza', 0, 0),              
                  buildHabilidade.habilidadeCaixa(context, 'Luta', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Intelecto', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Prontidão', 0, 0),
                  buildHabilidade.habilidadeCaixa(context, 'Presença', 0, 0),              
                ],
              ),
            ) 
          ),
    // ]
    )
    );
  }
}

