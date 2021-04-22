import 'package:flutter/material.dart';

import 'Widget/answer_widget/answer.widget.dart';
import 'Widget/question_indicator/question_indicator.widget.dart';
import 'Widget/quiz_question/quiz_question.widget.dart';

class ChallengePage extends StatefulWidget{
  ChallengePage({Key? key}) : super(key:key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
 

}

 class _ChallengePageState extends State<ChallengePage>{

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child:SafeArea(child: QuestionIndicatorWidget(),top: true)
      ),
      body: Column(
        
        children: [
        QuizQuestionWidget(title: "Quanto é 1 + 1",),
        AnswerWidget(question: "2",isRight: false,isSelected: true),
        AnswerWidget(question: "3",),
        AnswerWidget(question: "0",),
        AnswerWidget(question: "1",),
      ],)
    );
  }
}