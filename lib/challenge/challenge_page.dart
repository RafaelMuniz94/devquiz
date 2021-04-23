import 'package:DevQuiz/challenge/Widget/next_button/next_button.widget.dart';
import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';


import 'Widget/question_indicator/question_indicator.widget.dart';
import 'Widget/quiz_question/quiz_question.widget.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    if (controller.currentPage< widget.quiz.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  void onSelected(bool value){
      if(value){
        controller.points ++;
      }
      
      nextPage();
  }

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(86),
          child: SafeArea(
              top: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                      currentPage: value,
                      totalPage: widget.quiz.questions.length,
                    ),
                  )
                ],
              ))),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children:
              // QuizQuestionWidget(
              //   question: widget.questions[controller
              //       .currentPage], // acessor para parametros da classe stateful
              //),
              //
              widget.quiz.questions
                  .map((quiz) => QuizQuestionWidget(
                        question: quiz,
                        onSelected:  onSelected,
                      ))
                  .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (contex, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.quiz.questions.length)
                        Expanded(
                            child: NextButton.white(
                          label: "Pular",
                          onTap: () {
                            nextPage();
                          },
                        )),
                       
                        if (value == widget.quiz.questions.length)
                          Expanded(
                              child: NextButton.green(
                                  label: "Confirmar",
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                                      points: controller.points,
                                      quizName: widget.quiz.title,
                                      total: widget.quiz.questions.length,
                                    )));
                                  })),
                      ],
                    ))),
      ),
    );
  }
}
