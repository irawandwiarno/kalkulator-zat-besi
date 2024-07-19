import 'package:kalkulator_zat_besi/shared/package.dart';

class Gap extends StatelessWidget {
  const Gap({super.key});


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  ///Custom Height
  static Widget h(double height){
    return SizedBox(height: height,);
  }

  ///Custom width
  static Widget w(width){
    return SizedBox(width: width,);
  }

  ///Sizebox dengan hight 5
  static Widget h5(){
    return SizedBox(height: 5,);
  }
  ///Sizebox dengan hight 10
  static Widget h10(){
    return SizedBox(height: 10,);
  }

  ///Sizebox dengan hight 15
  static Widget h15(){
    return SizedBox(height: 15,);
  }

  ///Sizebox dengan hight 20
  static Widget h20(){
    return SizedBox(height: 20,);
  }

  ///Sizebox dengan width 5
  static Widget w5(){
    return SizedBox(width: 5,);
  }
  ///Sizebox dengan width 10
  static Widget w10(){
    return SizedBox(width: 10,);
  }
}
