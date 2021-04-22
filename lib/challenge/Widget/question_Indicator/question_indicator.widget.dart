import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/Widget/progress_indicator.widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget{
      final int currentPage;
      final int totalPage;
  const QuestionIndicatorWidget ({Key? key, required this.currentPage, required this.totalPage}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text("Questão ${this.currentPage}",
             style: AppTextStyles.body
             ),
        Text("de ${this.totalPage}",
         style: AppTextStyles.body),
          ]
        ),
        SizedBox(height: 16,),
        ProgressIndicatorWidget(
          value: (currentPage/totalPage),
        )
      ],),
    );
  }

}