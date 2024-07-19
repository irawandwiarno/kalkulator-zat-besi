import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  double? rounded;
  double? contentPadding;

  PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.rounded,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: GradientElevatedButton(
        onPressed: onPressed,
        style: GradientElevatedButton.styleFrom(
          gradient: MyColors.primaryGradien,
          foregroundColor: Colors.white, // Warna teks
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rounded ?? 15),
          ),
          padding: EdgeInsets.symmetric(vertical: contentPadding ?? 15),
        ),
        child: Text(title, style: MyText.title(color: Colors.white),),
      ),
    );
  }
}
