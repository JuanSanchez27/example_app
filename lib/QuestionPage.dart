import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sigaweb_app/DashboardPage.dart';

class QuestionPage extends StatefulWidget {
  static String id = 'QuestionPage';
  final Map<String, dynamic> datos;
  Map<String, dynamic> lista;

  QuestionPage(this.datos, this.lista);

  @override
  _QuestionPageState createState() => _QuestionPageState();

}

class _QuestionPageState extends State<QuestionPage> {

  @override
  void initState(){
    widget.lista.forEach((key, value) { });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Encuesta COVID Diaria",
            style: TextStyle(
              color: Colors.teal.shade600,
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
              var data = widget.datos;
              Navigator.of(context)
                  .pop(MaterialPageRoute(
                  builder: (context) => DashboardPage(data)
              )
              );
            },
          ),
        ),
        body: Column(
          children:[
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 300.0,
              child: Text(
                widget.lista['questions'][0]['statement'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Container(
              height: 500.0,
              child: ListView(

              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: SizedBox(
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.arrowAltCircleRight,
                    color: Colors.teal.shade600,
                    size: 30.0,
                  ),
                  onPressed: (){},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}