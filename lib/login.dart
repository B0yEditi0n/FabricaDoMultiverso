import 'package:flutter/material.dart';

import './loginScript.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => loginPageScreen();
}

class loginPageScreen extends State<loginPage> {
  @override
  var clLogin = new startLogin();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
          ),
          title: const Text('Fabrica do Multiverso'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        

        body: Center(
          child: Text( clLogin.userName('Caio') ),
          //  
        ),
      );
  }
}
