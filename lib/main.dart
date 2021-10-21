import 'package:flutter/material.dart';
import 'package:sigaweb_app/DashboardPage.dart';
import 'package:sigaweb_app/LoginPage.dart';
import 'package:sigaweb_app/QuestionPage.dart';
import 'package:sigaweb_app/CovidSubmitPage.dart';
import 'package:flutter/services.dart' ;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Sigaweb App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Nunito",
        unselectedWidgetColor: Colors.teal.shade600,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) =>
            DashboardPage(Map<String, dynamic>()),
        '/question': (context) =>
            QuestionPage(Map<String, dynamic>(), Map<String, dynamic>()),
        '/covidSubmit': (context) =>
            CovidSubmitPage(Map<String, dynamic>(), List.empty()),
      },
    );
  }
}
