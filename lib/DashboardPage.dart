import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sigaweb_app/LoginPage.dart';
import 'package:sigaweb_app/QuestionPage.dart';
import 'package:sigaweb_app/main.dart';
import 'package:sigaweb_app/services/api_service.dart';
import 'package:sigaweb_app/services/models/question_model.dart';

class DashboardPage extends StatefulWidget{
  static String id = 'DashboardPage';
  final Map<String, dynamic> data;

  DashboardPage(this.data);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  QuestionRequestModel questionRequestModel = new QuestionRequestModel();
  APIService apiService = new APIService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(widget.data['profile_image'],
                          width: 200.0,
                          height: 200.0,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          clipBehavior: Clip.hardEdge,
                          child: IconButton(
                            onPressed: () {
                              showDialog(context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                    child: Container(
                                      height: 400.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.network(widget.data['qrcode_image'],
                                          ),
                                          SizedBox(height: 20.0,),
                                          Text('Muestre este código QR al momento de ingresar a la institución.',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.teal.shade600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              );
                            },
                            icon: Icon(
                              FontAwesomeIcons.qrcode,
                            ),
                            color: Colors.teal.shade600,
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ),
                    ]
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.data['fullname'],
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20.0
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.data['institution'],
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15.0,
                    color: Colors.teal.shade600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.data['group'],
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
                      var datos = widget.data;
                      var lista = new Map<String, dynamic>();
                      if (widget.data['token'] != null) {
                        questionRequestModel.token = widget.data['token'].toString();
                        apiService.question(questionRequestModel).then((value) {
                          if (value.data.isNotEmpty) {
                            lista = value.data;
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (context) => QuestionPage(datos, lista)
                                )
                            );
                          }else{
                            AlertDialog(
                              title: Text(
                                  'Ocurrio un error al momento de generar las preguntas, comuniquese con soporte.'
                              ),
                            );
                          }
                        });
                      }
                      else{
                        AlertDialog(
                          title: Text(
                              'Ocurrio un error al momento de generar las preguntas, comuniquese con soporte.'
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.shieldAlt,
                      color: Colors.teal.shade300,
                      size: 30.0,
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
                  height: 100,
                ),
                Container(
                  width: 167.0,
                  height: 35.0,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context)
                        .pop(MaterialPageRoute(
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
        ),
      )
    );
  }
}