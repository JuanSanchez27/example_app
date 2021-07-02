class LoginRequestModel{
  String email;
  String pass;

  LoginRequestModel({
    this.email = '',
    this.pass = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'pass': pass.trim(),
    };
    return map;
  }
}

class LoginResponseModel{
  final String token;
  final String error;

  LoginResponseModel({
    this.token = '',
    this.error = '',
  });

  factory LoginResponseModel.formJson(Map<String, dynamic> json){
    return LoginResponseModel(
        token: json['token'] != null ? json['token']: '',
        error: json['error'] != null ? json['error']: '',
    );
  }
}