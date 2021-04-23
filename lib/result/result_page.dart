import 'package:DevQuiz/challenge/Widget/next_button/next_button.widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String quizName;
  final int points;
  final int total;

  const ResultPage({Key? key, required this.quizName, required this.points, required this.total}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(AppImages.trophy),
              )
            ],),
            Column(
              children: [
                Text("Parabéns", style: AppTextStyles.heading40),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body11,
                    children: [
                      TextSpan(
                          text: "\n${quizName}",
                          style: AppTextStyles.bodyBold),
                      TextSpan(
                          text: "\ncom $points de $total acertos",
                          style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: NextButton.purple(
                            label: "Compartilhar", onTap: () {
                              Share.share("Finalizei $quizName com $points de $total acertos ");
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: NextButton.transparent(
                            label: "Voltar ao Inicio",
                            onTap: () {
                              Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
    ));
  }
} // Tela sem estado
