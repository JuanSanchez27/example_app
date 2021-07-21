class LoginRequestModel{
  String document;
  String pass;

  LoginRequestModel({
    this.document = '',
    this.pass = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'document': document.trim(),
      'password': pass.trim(),
    };
    return map;
  }
}

class LoginResponseModel{
  String message;
  Map<String, dynamic> data;

  LoginResponseModel({
    this.message = '',
    this.data = const {},
  });

  factory LoginResponseModel.formJson(Map<String, dynamic> json){
    return LoginResponseModel(
        message: json['message'] != null ? json['message']: '',
        data: json['data'] != null ? json['data']: '',
    );
  }
}