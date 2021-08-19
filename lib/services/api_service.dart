import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sigaweb_app/services/models/answer_model.dart';
import 'dart:convert';

import 'package:sigaweb_app/services/models/login_model.dart';
import 'package:sigaweb_app/services/models/question_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String url = "http://api.sigaweb.co/api/v1/auth/login";

    final response =
        await http.post(Uri.parse(url), body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      return LoginResponseModel.formJson(json.decode(response.body));
    } else {
      Map<String, dynamic> body = json.decode(response.body);
      body.addAll({'data': new Map<String, dynamic>()});
      return LoginResponseModel.formJson(body);
    }
  }

  Future<QuestionResponseModel> question(
      QuestionRequestModel questionRequestModel) async {
    String url = "http://api.sigaweb.co/api/v1/covid-survey";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer ' + questionRequestModel.token,
      HttpHeaders.acceptHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      return QuestionResponseModel.formJson(json.decode(response.body));
    } else {
      throw Exception(
          'Ocurrio un error al momento de generar las preguntas, comuniquese con soporte.');
    }
  }

  Future<AnswerResponseModel> answer(
      AnswerRequestModel answerRequestModel) async {
    String url = "http://api.sigaweb.co/api/v1/covid-survey";

    print(answerRequestModel.toJson());

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer ' + answerRequestModel.token,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(answerRequestModel.toJson()),
    );

    if (response.statusCode == 200) {
      return AnswerResponseModel.fromJson(json.decode(response.body));
    } else {
      Map<String, dynamic> body = json.decode(response.body);
      body.addAll({'data': new Map<String, dynamic>()});
      print(body);
      return AnswerResponseModel.fromJson(body);
      //throw Exception('Ocurrio un error al momento de guardar las preguntas, comuniquese con soporte.');
    }
  }
}
