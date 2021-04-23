import 'package:DevQuiz/challenge/Widget/answer_widget/answer.widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizQuestionWidget extends StatefulWidget{
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizQuestionWidget({Key? key, required this.question, required this.onSelected}) : super(key:key);

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
   int selectedIndex = -1;

  AnswerModel answers(int index ) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(height: 64,),
        Text(widget.question.title, style: AppTextStyles.heading,),
        SizedBox(height: 24),
        for(int i =0 ; i < widget.question.answers.length; i ++) 
          AnswerWidget(
            answer: answers(i),
            disabled: selectedIndex != -1,
            isSelected: i == selectedIndex,
            onTap:  (value){
              selectedIndex = i;
              
              setState((){

              });
              Future.delayed(Duration(milliseconds: 1000)).then((_) => widget.onSelected(value)); // Quando a funçao devolve um value que deve ser ignorado, pode se usar o _
            },
          )
        
        //...widget.question.answers.map((answer) => AnswerWidget(question: answer.title,isRight: answer.isRight)).toList()
      ],
      ),
    );
  }
}