class NewQuestionModel {
  String? id;
  String? typeOfQuestion;
  String? mainGroup;
  String? question;
  String? questionGroup;
  DateTime? createat;

  NewQuestionModel({
    this.id,
    this.typeOfQuestion,
    this.mainGroup,
    this.question,
    this.questionGroup,
    this.createat,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['typeOfQuestion'] = typeOfQuestion;
    data['mainGroup'] = mainGroup;
    data['question'] = question;
    data['questionGroup'] = questionGroup;
    data['createat'] = createat;
    return data;
  }

  NewQuestionModel.fromJson(json, id) {
    this.id = id;
    typeOfQuestion = json['typeOfQuestion'];
    mainGroup = json['mainGroup'];
    question = json['question'];
    questionGroup = json['questionGroup'];
    createat = json['createat'].toDate();
  }
}
