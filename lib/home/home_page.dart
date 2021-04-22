import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/app_bar/app_bar.widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button.widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card.widget.dart';
import 'package:DevQuiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  
  HomePage({
    Key? key
  }) : super(key:key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage>{
  final controller =  HomeController();

  @override
  void initState(){
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() { // Padrao observer, que vai verificar todas as vezes que o notifier possuir o estado alterado
      setState((){}); // atualiza o estado
    });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.success){
    return Scaffold(
      appBar: AppBarWidget(user :controller.user!, totalCount: controller.quizzes!.fold(0,(quizz,atual) => quizz! + atual.questions.length) ?? 0,),
      body: Padding(
       padding: const EdgeInsets.symmetric(horizontal:1,vertical:24),
        child: Column(
                children:[ Padding(
                  padding: const EdgeInsets.only(bottom:24),
                  child: Row(
              
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            LevelButton(label:"Fácil"),
            LevelButton(label:"Médio"),
            LevelButton(label:"Difícil"),
            LevelButton(label:"Perito"),
          ],),
                ),
                Expanded(child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!.map((quiz) => QuizCardWidget(
                    label: quiz.title,
                    answered: quiz.questionsAnswered,
                    questionsCount: quiz.questions.length,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(questions: quiz.questions,)));
                    },
                  )).toList(),
                ))
                ]
        ),
      ),
    );
    }

    // return Scaffold(
    //   body: Center(child: CircularProgressIndicator(
    //     valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
    //   ),)
    // );
    // 


    return Splash();
  }

}