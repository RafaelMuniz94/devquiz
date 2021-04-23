import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget{

  Splash(){
    
  }// Construtor vazio

  @override
  Widget build(BuildContext context){

    Future.delayed(Duration(seconds: 2)).then((value) => 
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()))); // Isso so pode ocorrer pois esse componente é stateless, caso nao fosse ele deveria ser feito no construtor.
    // O pushReplacement retira da pilha aquela tela, sendo assim ela nao volta a aparecer.


    return Scaffold(
      body:Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo)
        ,)
      )
    );
  }
}