import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backend/loginScript.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => loginPageScreen();
}

class loginPageScreen extends State<loginPage> {
  @override
  var clLogin = startLogin();
  var inputEmail = TextEditingController();
  var inputSenha = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
          ),
          title: const Text('Fabrica do Multiverso'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: clLogin.btnLogin(context),
                // clLogin.btnLogin(context),
  
            ),
          ],
        ),
        

        body: Center(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              // Estilo do Countainer
              width: 600,
              height: 300,
              color: const Color.fromARGB(78, 1, 56, 175),

              padding: const EdgeInsets.all(16.0),

              child: Column(children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                  
                const Text( 'Login de Usuário', 
                  textAlign: TextAlign.center, ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome de Usuário',
                  ),
                  obscureText: false,
                  controller: inputEmail,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha de Usuário',
                  ),
                  obscureText: true,
                  controller: inputSenha,
                ),
                  
                ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                        }
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    if(clLogin.inputLogin(inputEmail.text, inputSenha.text)){
                      Navigator.popAndPushNamed(context, '/telaInicio');
                    };
                    
                    
                  },
                  // clLogin.inputLogin( inputEmail, inputSenha),
                  child:
                    const Text('Efetuar login'),  
                    
                )
              ],
              )
            ),
          ),
        ),        
      );
  }
}
