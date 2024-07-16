import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final int type;

  const HomeButton(
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
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: type == 2 ? Colors.white : null,
          gradient: type == 1 ? MyColors.primaryGradien : null,
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Center(
          child: type == 1
              ? Text(title,
                  style: const TextStyle(
                      fontFamily: "Nunito Sans",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
              : ShaderMask(
                  shaderCallback: (bounds) =>
                      MyColors.primaryGradien.createShader(bounds),
                  child: Text(title,
                      style: const TextStyle(
                          fontFamily: "Nunito Sans",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
        ), // Teks di dalam tombol
      ),
    );
  }
}
