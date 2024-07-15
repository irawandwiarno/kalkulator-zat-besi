import 'package:kalkulator_zat_besi/shared/package.dart';

class MyColors {
  static const Color primaryColor = Color(0xFFCD3333);
  static const Color backgroundApp = Color(0xFFFFFFFF);
  static const Color disable = Color(0xFF505050);
  static const Color gradienKanan = Color(0xFF5E2D2D);
  static const Color gradienKiri = Color(0xFFB73131);
  static const Color cardGrey = Color(0xFFD9D9D9);

  static const LinearGradient primaryGradien = LinearGradient(
    colors: [
      gradienKanan,
      gradienKiri,
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const Color transparan = Colors.transparent;
}
