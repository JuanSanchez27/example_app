import 'package:flutter/material.dart';
import 'package:sigaweb_app/DashboardPage.dart';
import 'package:sigaweb_app/LoginPage.dart';
import 'package:sigaweb_app/QuestionPage.dart';
import 'package:sigaweb_app/CovidSubmitPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Nunito",
        unselectedWidgetColor: Colors.teal.shade600,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id : (context) => LoginPage(),
        DashboardPage.id : (context) => DashboardPage(Map<String, dynamic>()),
        QuestionPage.id : (context) => QuestionPage(Map<String, dynamic>(), Map<String, dynamic>()),
        CovidSubmitPage.id : (context) => CovidSubmitPage(Map<String, dynamic>(), Map<String, dynamic>()),
      },
    );
  }
}
