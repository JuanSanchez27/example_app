import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigaweb_app/DashboardPage.dart';
import 'package:sigaweb_app/services/api_service.dart';
import 'package:sigaweb_app/services/models/login_model.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  LoginRequestModel loginRequestModel = new LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("assets/img/logo.png"),
                          width: 300.0,
                          height: 75.0,
                        ),
                        SizedBox(
                          height: 90.0,
                        ),
                        Text(
                          "Inicio de sesión",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Nunito",
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        _textFieldDocumento(),
                        SizedBox(height: 10.0),
                        _textFieldPass(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            width: 154.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                if (validateAndSave()) {
                                  APIService apiService = new APIService();
                                  apiService
                                      .login(loginRequestModel)
                                      .then((value) {
                                    if (value.data.isNotEmpty &&
                                        value.status == 200) {
                                      var Data = value.data;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DashboardPage(Data)));
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text(
                                              value.message,
                                              style: TextStyle(
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                          );
                                        });
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(fontFamily: "Nunito", fontSize: 17.0,),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(0, 166, 116, 1),
                              ),
                            )),
                        SizedBox(
                          height: 80.0,
                        ),
                        Text(
                          "¿Olvidó su contraseña?",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: "Nunito"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "¿No está registrado?",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: "Nunito"),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldDocumento() {
    return Container(
      width: 300.0,
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
          onSaved: (input) => loginRequestModel.document = input.toString(),
          validator: (input) {
            if (input == null || input.isEmpty) {
              return "Este campo es obligatorio";
            }
            if (input.length < 7) {
              return "Por favor digite un numero de documento valido";
            }
            return null;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "  No. Documento",
            hintStyle: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.grey.shade400,
            ),
          )),
      decoration: BoxDecoration(
        //color: Colors.grey.shade200,
      ),
    );
  }

  Widget _textFieldPass() {
    return Container(
      width: 300.0,
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
          onSaved: (input) => loginRequestModel.pass = input.toString(),
          validator: (input) {
            if (input == null || input.isEmpty) {
              return "Este campo es obligatorio";
            }
            return null;
          },
          obscureText: true,
          decoration: InputDecoration(
            hintText: "  Contraseña",
            hintStyle: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.grey.shade400,
            ),
          )),
      decoration: BoxDecoration(
        //color: Colors.grey.shade200,
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }
}
