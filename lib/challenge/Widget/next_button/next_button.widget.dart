import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget{
  final String label;
  final Color backgroundColor; // variavel privada inicia em _
  final Color fontColor; // variavel privada inicia em _
  final Color borderColor; // variavel privada inicia em _
  final VoidCallback onTap;
   NextButton({required this.label, required this.backgroundColor, required this.fontColor,required this.borderColor, required this.onTap});

  NextButton.green({required String label, required VoidCallback onTap}): 
  this.backgroundColor = AppColors.darkGreen,
  this.fontColor = AppColors.white,
  this.label = label,
  this.borderColor = AppColors.lightGreen,
  this.onTap = onTap; // Construtor nomeado

  NextButton.white({required String label, required VoidCallback onTap}):
  this.backgroundColor = AppColors.white,
  this.fontColor = AppColors.grey,
  this.label = label,
  this.borderColor = AppColors.lightGrey,
  this.onTap = onTap;
  


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      
      child: (TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
            side:MaterialStateProperty.all(BorderSide(color: borderColor))
        ),
        onPressed: onTap, 
        child: Text(label, style: GoogleFonts.notoSans(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: fontColor,
      ),)))
      ,);
  }

}