import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/chart/chart.widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final int score;
  const ScoreCardWidget({Key? key ,  required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
          height: 136,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.fromBorderSide(
              BorderSide(
              color: AppColors.lightGrey)
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: ChartWidget()),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vamos começar!",
                            style: AppTextStyles.heading,
                          ),
                          Text(
                            "Complete os desafios e avançe em conhecimento",
                            style: AppTextStyles.body,
                          )
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
