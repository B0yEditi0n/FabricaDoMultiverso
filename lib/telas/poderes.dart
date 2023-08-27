import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '/widgets/widgetConstutor.dart';
import '/backend/controllador.dart';

class poderesPage extends StatefulWidget {
  const poderesPage({super.key});

  @override
  State<poderesPage> createState() => _poderesPageState();
}

class _poderesPageState extends State<poderesPage> {
  
  widgetConstrutor reBuild = widgetConstrutor();
  Controllador control = Controllador();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poderes'),
      ),
      drawer: reBuild.barraLatera(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
          
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  Container(
                    width: (MediaQuery.of(context).size.width * 0.30 ), // tamanho relativo
                    height: 2,
                    color: Colors.white,
                  ),
          
                  OutlinedButton(                  
                    onPressed:() {
                      control.addPower();
                    }, 
          
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,                       
                        )
                      ),
          
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30, 
                      ),
                    ),            
                  ),
                  
                  Container(
                    width: (MediaQuery.of(context).size.width * 0.30 ), // tamanho relativo
                    height: 2,
                    color: Colors.white,
                  ),
                ],
            ),
          )
        ],
      ),
    );
  }
}