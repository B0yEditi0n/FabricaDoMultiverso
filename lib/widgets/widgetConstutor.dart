import 'package:flutter/material.dart';

class widgetConstrutor{
  menuBarra(){
    //   return (
    //     Container(
    //       child: AppBar(
    //         title: const Text('Menu Principal'),
    //       ),
    //   ),
    // );

  }
  barraLatera(context){
    return Drawer(
      child: ListView(
        children: [         
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize:,
              children: [
                TextButton(
                  child: const Text('Menu Principal'),
                  onPressed:() {
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, '/telaInicio');
                  }, 
                ),
                TextButton(
                  child: const Text('Habilidades'),
                  onPressed:() {
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, '/habilidadesTela');
                  }, 
                ),
                TextButton(
                  child: const Text('Defesas'),
                  onPressed:() {
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, '/defesasTela');
                  }, 
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }

}