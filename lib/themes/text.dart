import 'package:kalkulator_zat_besi/shared/package.dart';

class MyText {
  static TextStyle oversize({Color color = Colors.black}) {
    return TextStyle(fontSize: 100, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle h1({Color color = Colors.black}) {
    return TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h2({Color color = Colors.black}) {
    return TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h3({Color color = Colors.black}) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle h4({Color color = Colors.black}) {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h5({Color color = Colors.black}) {
    return TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle title({Color color = Colors.black}) {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle subtitle({Color color = Colors.black}) {
    return TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: color);
  }
}
