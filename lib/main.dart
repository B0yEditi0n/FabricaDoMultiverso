
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Tela de Login
import './login.dart';
import './home.dart';
import './habilidades.dart';
import './defesas.dart';
import './poderes.dart';


Future<void> main() async {

  //Firebase integração
/*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
);*/

  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: true,
    // theme: new ThemeData(
    //   scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1)),

    initialRoute: '/loginTela',
    routes: {
      '/loginTela' : (context) => loginPage(),
      /*'/cadastroTela': (context) => const TelaCadastro(),*/
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