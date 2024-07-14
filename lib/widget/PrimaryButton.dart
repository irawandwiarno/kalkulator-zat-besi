import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
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
            borderRadius: BorderRadius.circular(15), // Bentuk sudut tombol
          ),
          padding: const EdgeInsets.symmetric(vertical: 15), // Padding di dalam tombol
        ),
        child: Text(title, style: MyText.title(color: Colors.white),), // Teks di dalam tombol
      ),
    );
  }
}
