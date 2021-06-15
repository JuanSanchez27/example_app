import 'package:flutter/material.dart';
import 'package:sigaweb_app/LoginPage.dart';
import 'package:sigaweb_app/QuestionPage.dart';

class DashboardPage extends StatelessWidget{
  static String id = 'DashboardPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset("img/profile_pic.jpg"),
                  width: 150.0,
                  height: 150.0,

              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "José María",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 30.0
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Institución Educativa La Panela",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15.0,
                  color: Colors.teal.shade600,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(
                width: 320.0,
                height: 40.0,
                child: OutlinedButton.icon(
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => QuestionPage()
                    )
                    );
                  },
                  icon: Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.teal.shade300,
                    size: 40.0,
                  ),
                  label: Text(
                    "Encuesta COVID Diaria",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                width: 167.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (context) => LoginPage()
                      )
                    );
                  },
                  child: Text(
                    "Cerrar sesión",
                    style: TextStyle(
                      color: Colors.teal.shade600,
                      fontFamily: "Nunito",
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