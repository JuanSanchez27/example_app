class AnswerRequestModel{
  String token;
  Map<String, dynamic> data;

  AnswerRequestModel({
    this.token = '',
    this.data = const {},
  });

  Map<String,List<Map<String, dynamic>>> toJson(){
    Map<String, List<Map<String, dynamic>>> map = {
      'questions' : [data],
    };

    print(data);

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