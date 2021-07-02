import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sigaweb_app/services/models/login_model.dart';

class APIService {

  Future<LoginResponseModel> login (LoginRequestModel loginRequestModel) async {
    String url = "http://api.sigaweb.co/api/v1/auth/login";

    final response = await http.post(Uri.parse(url), body: loginRequestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.formJson(json.decode(response.body));
    }else{
      throw Exception('Ocurrio un error al momento de iniciar sesión, comuniquese con soporte.');
    }

  }
}