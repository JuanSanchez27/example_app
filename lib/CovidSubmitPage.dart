import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sigaweb_app/services/api_service.dart';
import 'package:sigaweb_app/services/models/answer_model.dart';
import 'package:sigaweb_app/utils/responsive.dart';

import 'DashboardPage.dart';

class CovidSubmitPage extends StatefulWidget {
  static String id = 'CovidSubmitPage';
  final Map<String, dynamic> data;
  final List<dynamic> list;

  CovidSubmitPage(this.data, this.list);

  @override
  _CovidSubmitPageState createState() => _CovidSubmitPageState();
}

class _CovidSubmitPageState extends State<CovidSubmitPage> {
  AnswerRequestModel answerRequestModel = new AnswerRequestModel();
  APIService apiService = new APIService();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Encuesta COVID Diaria",
          style: TextStyle(color: Colors.teal.shade600, fontFamily: "Nunito"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal.shade600,
                width: 2.0,),
            ),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.teal.shade600,
              ),
              onPressed: () {
                var data = widget.data;
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        settings: const RouteSettings(name: '/dashboard'),
                        builder: (context) => DashboardPage(data)
                    )
                );
              },
            ),
          ),
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
              child: Text(
                "Si la respuesta a alguna de las anteriores preguntas es positiva, es necesario que el estudiante se quede en casa y no asista al colegio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: responsive.hp(30.0),
            ),
            Container(
              width: responsive.wp(80.0),
              height: responsive.hp(6.0),
              child: ElevatedButton(
                onPressed: () {
                  if (widget.data['token'] != null) {
                    answerRequestModel.token = widget.data['token'].toString();
                    answerRequestModel.data = widget.list;
                    apiService.answer(answerRequestModel).then((value) {
                      print(value.status);
                      if (value.status == 200 || value.status == 500) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                settings: const RouteSettings(name: '/dashboard'),
                                builder: (context) => DashboardPage(widget.data)
                            )
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('AVISO!',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                  ),),
                                content: Text(
                                  'La encuesta ha sido enviada satisfactoriamente.',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              );
                            }
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
    ));
  }
}
