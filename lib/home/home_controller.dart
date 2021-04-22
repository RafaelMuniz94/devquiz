import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/enums/level_enum.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController{
  //Gerencia 
  //State da tela
  // User
  // Quizzes
  
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  // void getUser() async{
  //   state = HomeState.loading;
  //   await Future.delayed(Duration(seconds: 2));
  //   state = HomeState.success;
  //   user = UserModel(
  //     name: "Rafael ",
  //     photo: "https://avatars.githubusercontent.com/u/26208069?v=4",
  //   );
  // }
  // 
   void getUser() async{
     state = HomeState.loading;
     user = await repository.getUser();
     state = HomeState.success;
  }
    void getQuizzes() async{
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }

  // void getQuizzes() async{
  //   state = HomeState.loading;
  //   await Future.delayed(Duration(seconds: 2));
  //   state = HomeState.success;
  //   quizzes = [
  //     QuizModel(title: "A labuta dos macacos", questions: [QuestionModel(title: "Qual o maior dos macacos", answers: [
  //       AnswerModel(title: "Gorila", isRight: true), AnswerModel(title: "Orangotango"),AnswerModel(title: "Chimpanze"),AnswerModel(title: "Babuino")
  //     ])], image: AppImages.blocks, level: Level.facil)
  //   ];
  // }
}