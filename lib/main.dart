
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Tela de Login
import 'telas/login.dart';
import 'telas/home.dart';
import 'telas/habilidades.dart';
import 'telas/defesas.dart';
import 'telas/poderes.dart';

//Aproveitamento de Código
import 'widgets/widgetConstutor.dart';


Future<void> main() async {

  //Firebase integração
/*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
);*/

  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1)),

    initialRoute: '/loginTela',
    routes: {
      '/loginTela' : (context) => loginPage(),
      '/telaInicio': (context) => homePage(),
      '/habilidadesTela': (context) => habilidadesTela(),
      '/defesasTela': (context) => defesaPage(),
      '/poderesTela': (context) => poderesPage(),
    },
  ));
}

// Função simples para controlar login
rotaInicial(){
  // Fazer funcionar quando o fire base estiver disponível
  return ('/loginTela');
}

