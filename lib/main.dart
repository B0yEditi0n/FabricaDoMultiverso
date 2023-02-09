
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


//Tela de Login
import './login.dart';
import './home.dart';




Future<void> main() async {

  //Firebase integração
/*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
);*/

  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: true,

    initialRoute: '/loginTela',
    routes: {
      '/loginTela' : (context) => loginPage(),
      /*'/cadastroTela': (context) => const TelaCadastro(),*/
      '/telaInicio': (context) => homePage(),
      /*'/listadeusuarios': (context) => const ListaUsuarios(),
      '/detalhesContaUsuario': (context) => const detalhesContaUsuario(),
      '/configurausu': (context) => const configuraUsuario(),
      '/bloqueioAparelho': (context) => const BloqueioAparelho(),
      '/sobreNos': (context) => const SobreNos(),
      '/configuraTela': (context) => const ConfigTela(),
      '/contribua': (context) => const Contribua(),*/
    },
  ));
}

// Função simples para controlar login
rotaInicial(){
  // Fazer funcionar quando o fire base estiver disponível
  return ('/loginTela');
}