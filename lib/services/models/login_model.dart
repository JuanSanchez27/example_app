class LoginRequestModel {
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

class LoginResponseModel {
  int status;
  String message;
  Map<String, dynamic> data;

  LoginResponseModel({
    this.status = 0,
    this.message = '',
    this.data = const {},
  });

  factory LoginResponseModel.formJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] != null ? json['status'] : '',
      message: json['message'] != null ? json['message'] : '',
      data: json['data'] != null ? json['data'] : '',
    );
  }
}
