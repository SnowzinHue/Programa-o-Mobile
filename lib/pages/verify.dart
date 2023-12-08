import 'dart:io';

import 'package:atividadepref/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AcceptPage extends StatefulWidget {
  const AcceptPage({super.key});

  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  bool isChecked = false;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    String acceptText = getAcceptText();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 34, 65),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Termo de uso:',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(acceptText),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Eu li e concordo com os termos de uso',
                      style: TextStyle(color: Colors.white),
                    ),
                    Checkbox(
                      side: const BorderSide(color: Colors.white),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          onPressed = isChecked ? () => goHome() : null;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: const Text('Recusar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: onPressed,
                      child: const Text('Avançar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goHome() {
    PrefsService.save();
    Navigator.of(context).pushReplacementNamed('/home');
  }

  String getAcceptText() {
    return '''
 O silencio vale mais que 1000 palavras. ''';
  }
}
