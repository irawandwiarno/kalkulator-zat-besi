import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';

class ExpandedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  bool gradientButton;
  Color? color;
  Color textColor;
  Gradient? gradient;
  double? rounded;
  double? contentPadding;

  ExpandedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.rounded,
    this.contentPadding,
    this.gradientButton = false,
    this.color = Colors.grey,
    this.textColor = Colors.black,
    this.gradient = MyColors.primaryGradien,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: gradientButton
          ? GradientElevatedButton(
              onPressed: onPressed,
              style: GradientElevatedButton.styleFrom(
                gradient: gradient,
                foregroundColor: Colors.white, // Warna teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(rounded ?? 15),
                ),
                padding: EdgeInsets.symmetric(vertical: contentPadding ?? 15),
              ),
              child: Text(
                title,
                style: MyText.title(color: textColor),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white, // Warna teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(rounded ?? 15),
                ),
                padding: EdgeInsets.symmetric(vertical: contentPadding ?? 15),
              ),
              child: Text(
                title,
                style: MyText.title(color: textColor),
              ),
            ),
    );
  }
}
