import 'package:flutter/material.dart';

//Tela de Login
import './login.dart';

Future<void> main() async {

  //Firebase integração
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: true,

    initialRoute: '/loginTela',
    routes: {
      '/loginTela': (context) => loginPage(),
      /*'/cadastroTela': (context) => const TelaCadastro(),
      '/telaPrincipal': (context) => const TelaPrincipal(),
      '/listadeusuarios': (context) => const ListaUsuarios(),
      '/detalhesContaUsuario': (context) => const detalhesContaUsuario(),
      '/configurausu': (context) => const configuraUsuario(),
      '/bloqueioAparelho': (context) => const BloqueioAparelho(),
      '/sobreNos': (context) => const SobreNos(),
      '/configuraTela': (context) => const ConfigTela(),
      '/contribua': (context) => const Contribua(),*/
    },
  ));
}

