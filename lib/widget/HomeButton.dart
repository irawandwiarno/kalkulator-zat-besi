import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';

class OutlineGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final int type;

  const OutlineGradientButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: screenWidth,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          gradient: MyColors.primaryGradien,
        ),
        child: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(19), // Adjust according to outer radius
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  MyColors.primaryGradien.createShader(bounds),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
