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
  Map<String, dynamic> data;

  AnswerResponseModel({
   this.data = const{},
  });

  factory AnswerResponseModel.fromJson(Map<String, dynamic> json){
    return AnswerResponseModel(
      data: json['data'] != null ? json['data']: '',
    );
  }
}