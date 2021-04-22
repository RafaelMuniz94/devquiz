import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/Widget/progress_indicator.widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String label;
  final int answered;
  final int questionsCount;
  const QuizCardWidget({Key? key, required this.label,required this.answered, required this.questionsCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: AppColors.grey)),
            color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 40, width: 40, child: Image.asset(AppImages.blocks)),
            SizedBox(
              height: 24,
            ),
            Text(label, style: AppTextStyles.heading15),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("${this.answered} de ${this.questionsCount}", style: AppTextStyles.body11),
                ),
                ProgressIndicatorWidget(
                  value: this.answered/this.questionsCount,
                )
              ],
            )
          ],
        ));
  }
}
