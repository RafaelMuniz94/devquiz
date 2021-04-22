import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizQuestionWidget extends StatelessWidget{
  final String title;
  const QuizQuestionWidget({Key? key, required this.title}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(title, style: AppTextStyles.heading,),
        SizedBox(height: 24),
      ],
      ),
    );
  }

}