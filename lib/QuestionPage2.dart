import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigaweb_app/QuestionPage3.dart';

import 'DashboardPage.dart';
import 'QuestionPage.dart';

class QuestionPage2 extends StatefulWidget {
  static String id = 'QuestionPage2';

  @override
  _QuestionPageState2 createState() => _QuestionPageState2();
}

class _QuestionPageState2 extends State<QuestionPage2> {

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
                "¿En las últimas 24 horas el estudiante ha tenido contacto estrecho (más de 15 minutos a menos de 1 metro de distancia), "
                    "con personas que actualmente estén diagnosticadas positivas para COVID 19?",
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
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.teal.shade600,
                    ),
                    onPressed: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => QuestionPage()
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
                      Icons.arrow_forward_rounded,
                      color: Colors.teal.shade600,
                    ),
                    onPressed: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => QuestionPage3()
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