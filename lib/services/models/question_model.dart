
class QuestionRequestModel{
  String token;

  QuestionRequestModel({
    this.token = ''
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'token': token,
    };

    return map;
  }
}

class QuestionResponseModel{
  Map<String, dynamic> data;

  QuestionResponseModel({
    this.data = const{},
  });

  factory QuestionResponseModel.formJson(Map<String, dynamic> json){
    return QuestionResponseModel(
      data: json['data'] != null ? json['data']: '',
    );
  }
}