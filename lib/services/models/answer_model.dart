class AnswerRequestModel{
  String token;
  List<dynamic> data;

  AnswerRequestModel({
    this.token = '',
    this.data = const [],
  });

  Map<String,List<dynamic>> toJson(){
    Map<String, List<dynamic>> map = {
      "questions" : data,
    };

    return map;
  }
}

class AnswerResponseModel{
  int status;
  String message;
  Map<String, dynamic> data;

  AnswerResponseModel({
    this.status = 0,
    this.message = '',
    this.data = const{},
  });

  factory AnswerResponseModel.fromJson(Map<String, dynamic> json){
    return AnswerResponseModel(
      status: json['status'] != null ? json['status'] : '',
      message: json['message'] != null ? json['message']: '',
      data: json['data'] != null ? json['data']: '',
    );
  }
}