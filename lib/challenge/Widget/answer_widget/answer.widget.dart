import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String question;
  final bool isRight;
  final bool isSelected;
  const AnswerWidget(
      {Key? key,
      required this.question,
      this.isRight = false,
      this.isSelected = false})
      : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => isRight? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight? Icons.check : Icons.error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? _selectedBorderCardRight:AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
              color: isSelected ? _selectedBorderCardRight : AppColors.grey,
            ))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(question, style: isSelected ? _selectedTextStyleRight: AppTextStyles.body)),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight: AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                        BorderSide(color: isSelected ? _selectedBorderRight : AppColors.border))),
                child: Icon(isSelected ? _selectedIconRight : null, size: 16, color:  AppColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
