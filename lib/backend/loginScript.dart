import 'package:flutter/material.dart';
/* Pop up
return showDialog<String>(context: context,
              builder: ((context) => const AlertDialog(
                title: Text('Alerta'),
                content: Text('Botão Funcionou'),

    )))
*/
class startLogin{
  bool goLoginPage = false;
  inputLogin(String email, String senha ){
    //return
    if((email != null) && (senha != null)){
      goLoginPage = true;
    }
    
  }
  userName(nameUser){
    return ('Olá ${nameUser}');
    
  }
  
  btnLogin(context){
    Navigator.pushReplacementNamed(context, '/telaInicio');
    if (this.goLoginPage){
       
    }
    

  }
}

