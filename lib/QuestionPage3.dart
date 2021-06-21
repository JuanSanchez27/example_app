import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DashboardPage.dart';
import 'QuestionPage2.dart';
import 'QuestionPage4.dart';

class QuestionPage3 extends StatefulWidget {
  static String id = 'QuestionPage3';

  @override
  _QuestionPageState3 createState() => _QuestionPageState3();
}

class _QuestionPageState3 extends State<QuestionPage3> {
  String selectedValue = "";

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
              Navigator.of(context)
                  .push(MaterialPageRoute(
                  builder: (context) => DashboardPage()
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
                "¿En los últimos 15 días el estudiante tuvo contacto con personas que tuvieran síntomas de enfermedades respiratorias o fiebre?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 310.0,
              child: ListView(
                children: [
                  RadioListTile(
                    value: "si",
                    groupValue: selectedValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Si"),
                    onChanged: (val) => setState(() {
                      selectedValue = "si";
                    }),
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RadioListTile(
                    value: "no",
                    groupValue:  selectedValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("No"),
                    onChanged: (val) => setState(() {
                      selectedValue = "no";
                    }
                    ),
                    tileColor: Colors.teal.shade100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      color: Colors.teal.shade600,
                      size: 30.0,
                    ),
                    onPressed: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => QuestionPage2()
                      ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 100.0,
                ),
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowAltCircleRight,
                      color: Colors.teal.shade600,
                      size: 30.0,
                    ),
                    onPressed: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => QuestionPage4()
                      ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}