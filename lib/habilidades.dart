import 'package:flutter/material.dart';

class habilidadesTela extends StatefulWidget {
  // const habilidadesTela({super.key});
  @override
  State<habilidadesTela> createState() => _habilidadesTelaState();
}

class _habilidadesTelaState extends State<habilidadesTela> {
  
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

        color: Color.fromARGB(255, 255, 0, 0),
        
        child: Align(
          
          alignment: Alignment(0.2, 0.6),
          
          child: Column(                     
            
            children: <Widget> [
              
              Container(                
                color: Color.fromARGB(255, 38, 0, 255),
                alignment: Alignment.center,
                child: Column(children: [                  
                  //Row(                    
                    //children: const <Widget>  [
                      Text('Força',
                      textAlign: TextAlign.center,
                      ),
                    //],
                  //),
                  //Row(
                    //children: const <Widget>[
                      Center(
                        
                        child: Row(                        
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                                     
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: const [
                                    Text('Bônus'),
                                    Text('10')
                                  ]                              
                                ),
                              ),
                            ),
                            
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  Text('Valor Total'),
                                  Text('10')
                                ],
                              ),
                            )
                        ]),
                      ),

                      
                    //]
                  //),             
                ],)
               
              )
            ],
          ),
        ) 
      ),
    );
  }
}