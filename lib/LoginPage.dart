import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sigaweb_app/DashboardPage.dart';

class LoginPage extends StatelessWidget{

  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Image.asset("assets/img/logo.png"),
                width: 300.0,
                height: 75.0,

              ),
              SizedBox(
                height: 100.0,
              ),
              Text("Inicio de sesión",
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Nunito",
              ),
              ),
              SizedBox(height: 40.0,
              ),
              _textFieldDocumento(),
              SizedBox(height: 15.0
              ),
              _textFieldPass(),
              SizedBox(height: 20.0,
              ),
              Container(
                width: 154.0,
                height: 50.0,
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (context) => DashboardPage()
                    )
                  );
                },
                  child: Text("Entrar",
                    style: TextStyle(
                        fontFamily: "Nunito"
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade600,
                  ),
                )
              ),
              SizedBox(height: 150.0,
              ),
              Text("¿Olvidó su contraseña?",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontFamily: "Nunito"
                ),
              ),
              SizedBox(height: 15.0,
              ),
              Text("¿No está registrado?",
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: "Nunito"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _textFieldDocumento() {
    return Container(
      width: 300.0,
      child: TextField(
          decoration: InputDecoration(
            hintText: "No. Documento",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
            )
          )
      ),
    );
  }

  Widget _textFieldPass() {
    return Container(
      width: 300.0,
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
              )
          )
      ),
    );
  }

}