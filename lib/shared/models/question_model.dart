import 'dart:convert';

import 'package:DevQuiz/shared/models/answer_model.dart';

class QuestionModel{
  final String title;
  final List<AnswerModel> answers;


  QuestionModel({
    required this.title,
    required this.answers
  }): assert( answers.length == 4); // o assert obriga a ter 4 perguntas

  Map<String,dynamic> toMap(){
    return{
      'title': title,
      'answers': answers.map((answer) => answer.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String,dynamic> map){
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(map['answers'].map((answer) => AnswerModel.fromMap(answer))),
    );
  }

  String toJSon() => json.encode(toMap());
  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}