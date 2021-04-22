import 'package:DevQuiz/challenge/Widget/next_button/next_button.widget.dart';
import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'Widget/answer_widget/answer.widget.dart';
import 'Widget/question_indicator/question_indicator.widget.dart';
import 'Widget/quiz_question/quiz_question.widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
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
                      totalPage: widget.questions.length,
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
              widget.questions
                  .map((quiz) => QuizQuestionWidget(
                        question: quiz,
                        onChange: nextPage,
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
                        if (value < widget.questions.length)
                        Expanded(
                            child: NextButton.white(
                          label: "Pular",
                          onTap: () {
                            nextPage();
                          },
                        )),
                       
                        if (value == widget.questions.length)
                          Expanded(
                              child: NextButton.green(
                                  label: "Confirmar",
                                  onTap: () {
                                    Navigator.pop(context);
                                  })),
                      ],
                    ))),
      ),
    );
  }
}
