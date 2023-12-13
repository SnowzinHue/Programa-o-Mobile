// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tela_login/controllers/login_controller.dart';
import 'package:tela_login/widgets/books.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onPressedButton() {
    var loginController =
        LoginController(phoneController.text, passwordController.text);
    if (loginController.isValidLogin()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookApp()),
      );
    } else {
      showAlertDialog1(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: phoneController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 109, 170), fontSize: 27),
                    decoration: InputDecoration(
                      labelText: "Telefone do usuário",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    controller: passwordController,
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Color.fromARGB(255, 35, 109, 170), fontSize: 27),
                    decoration: InputDecoration(
                      labelText: "Senha do usuário",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: MaterialButton(
                    onPressed: onPressedButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color.fromARGB(255, 46, 159, 224),
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: const Center(child: Text("Login Usuário")),
    content: const Text('Login incorreto, Tente novamente!'),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
