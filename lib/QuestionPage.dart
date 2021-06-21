import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sigaweb_app/DashboardPage.dart';
import 'package:sigaweb_app/QuestionPage2.dart';

class QuestionPage extends StatefulWidget {
  static String id = 'QuestionPage';

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool value = false;
  bool value2 = false;

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
                "¿Ha presentado alguno de los siguientes sintomas en las ultimas 24 horas?",
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
                children: [
                  Container(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.teal.shade600,
                      title: Text("Dolor de cabeza"),
                      value: value2,
                      onChanged: (value) => setState(() => this.value2 = value!),
                      tileColor: Colors.teal.shade100,

                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Fiebre"),
                    value: value,
                    onChanged: (value) => setState(() => this.value = value!),
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Tos peristente"),
                    value: value,
                    onChanged: (value) => this.value = value!,
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Dificultad para respirar"),
                    value: value,
                    onChanged: (value) => this.value = value!,
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Dolor estomacal o vómito persistente"),
                    value: value,
                    onChanged: (value) => this.value = value!,
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Diarrea persistente"),
                    value: value,
                    onChanged: (value) => this.value = value!,
                    tileColor: Colors.teal.shade100,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.teal.shade600,
                    title: Text("Dolor de garganta"),
                    value: value,
                    onChanged: (value) => this.value = value!,
                    tileColor: Colors.teal.shade100,
                  ),
                ],
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
                  onPressed: (){
                    Navigator.of(context)
                          .push(MaterialPageRoute(
                      builder: (context) => QuestionPage2()
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}