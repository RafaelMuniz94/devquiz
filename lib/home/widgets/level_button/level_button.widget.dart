import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButton extends StatelessWidget {
  final String label;

  LevelButton({Key? key, required this.label})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final config = {
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "fontColor": AppColors.levelButtonTextMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
    },
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "fontColor": AppColors.levelButtonTextFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
    },
    "Difícil": {
      "color": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
            BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 6),
        child: Text(label,
            style: GoogleFonts.notoSans(
                color: fontColor,
                fontSize: 13,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
