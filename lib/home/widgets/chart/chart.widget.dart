import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int score;
  final int questionTotal;
  const ChartWidget({Key? key, required this.questionTotal, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 88,

      child: Stack(children: [
        Center(
          child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: (score/questionTotal),
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              )),
        ),
        Center(child: Text("${(score/questionTotal).round()}%", style: AppTextStyles.heading))
      ]), //Pilha para colocar objetos empilhados
    );
  }
}
