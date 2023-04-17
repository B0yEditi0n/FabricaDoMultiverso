import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../habilidades.dart';

class setarEstado{
  final void Function() mudaValor;
  
  setarEstado(this.mudaValor);

}

barraDeTitulo(var titulo){
  return AppBar(
        title: Text(titulo),
        );
}

barraLateral(){
  Container(
        color: const Color.fromARGB(255, 13, 14, 92),
        child:           
          const Text(
            'Titulo', 
            selectionColor: Colors.white,            
            )
        );
}

itemMenuLateral(context, String titulo, String rota){
  return TextButton(
    child: Text(titulo),
    onPressed:() {
      Navigator.popAndPushNamed(context, rota);
    }
  );
}

menuLateral(context, String rotaAtual){
  
  var listaRotas = [
    '/loginTela',
    '/telaInicio',
    '/habilidadesTela',
    '/defesasTela',
    '/poderesTela'    
  ];

  listaRotas.remove(rotaAtual);

  return Padding(
          
    padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize:,
      children: [
        TextButton(
          child: const Text('Menu Principal'),
          onPressed:() {
            Navigator.pop(context);
          }, 
        ),
        TextButton(
          child: const Text('Habilidades'),
          onPressed:() {
            Navigator.popAndPushNamed(context, '/habilidadesTela');
          }, 
        ),
        TextButton(
          child: const Text('Defesas'),
          onPressed:() {
            Navigator.popAndPushNamed(context, '/defesasTela');
          }, 
        ),
        
        itemMenuLateral(context, 'Poderes', '/defesasTela'),
      ]
    ),
  ); 
}

habilidadeCaixa(context, String titulo, int bonus, int total) {     
  bonus;
  total;

  return StatefulBuilder(builder: (context, setState,) {
  return  (
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
                              popUpNumberPicker(context, titulo, total),
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
    },
  );
  }

wdgButton(BuildContext contexto, String txtTitle, String rotaTela){
    return( 
      Container(
        child:
        Padding(
          padding: const EdgeInsets.fromLTRB(0,15,0,0),
          child: SizedBox(   
            width: 6000,       
            height: 30,
            
            //style: BoxDecoration(color:
            child: 
              TextButton(       
                style: const ButtonStyle(               
   
                ),
                child: 
                Text(
                  style: const TextStyle(
                    fontFamily: 'Anton',
                    color: Colors.white,                      
                  ),//wdgButtonStyle(),
                  txtTitle
                  ),
                onPressed: (){
                  Navigator.popAndPushNamed(contexto, rotaTela);

                },
              ),
          ),
        ),      
      )
    );
  }

  popUpNumberPicker(BuildContext contexto, String titulo, int total)async {
    // final ValueListenable<int> number;
    
    // MyWidget(this.number);

    int valorHabili = total;
    //var currentValue = 0;
    await showDialog(
    context: contexto,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {   
      return  AlertDialog(
        title: Text('Valor de $titulo'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              NumberPicker(              
                value: valorHabili,
                minValue: 0,
                maxValue: 50,
                onChanged: (setaValor) => setState(() => valorHabili = setaValor),            
              
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed:// this.mudaValor
            () {

              // setState(() => total = valorHabili);
              //setarEstado()
              // setarFor(10);
              //setState();
              //referecFunction.mudaValor();
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