import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigaweb_app/services/api_service.dart';
import 'package:sigaweb_app/services/models/answer_model.dart';

import 'DashboardPage.dart';

class CovidSubmitPage extends StatefulWidget {
  static String id = 'CovidSubmitPage';
  final Map<String, dynamic> data;
  final Map<String, dynamic> list;

  CovidSubmitPage(this.data, this.list);

  @override
  _CovidSubmitPageState createState() => _CovidSubmitPageState();
}

class _CovidSubmitPageState extends State<CovidSubmitPage>{
  AnswerRequestModel answerRequestModel = new AnswerRequestModel();
  APIService apiService = new APIService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Encuesta COVID Diaria",
            style: TextStyle(
              color: Colors.teal.shade600,
              fontFamily: "Nunito"
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.teal.shade600,
            ),
            onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(
                  builder: (context) => DashboardPage(widget.data)
              )
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.0,
              ),
              Container(
                width: 250.0,
                child: Text("Si la respuesta a alguna de las anteriores preguntas es positiva, es necesario que el estudiante se quede en casa y no asista al colegio",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
              Container(
                width: 350.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: (){
                    if (widget.data['token'] != null) {
                      answerRequestModel.token = widget.data['token'].toString();
                      answerRequestModel.data = widget.list;
                      apiService.answer(answerRequestModel).then((value) {
                        if (value.data.isNotEmpty) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                              builder: (context) => DashboardPage(widget.data)
                          )
                          );
                        }
                      });
                    }
                  },
                  child: Text(
                      "Aceptar",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.teal.shade600,
                      ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade100,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}