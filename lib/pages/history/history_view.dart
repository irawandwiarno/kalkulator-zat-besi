import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/stick_bar/stick_bar.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  var data = [
    {'name': 'beras', 'zat_besi': 0.4},
    {'name': 'beras', 'zat_besi': 3},
    {'name': 'beras', 'zat_besi': 0.8},
    {'name': 'beras', 'zat_besi': 0.4}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: StickBar(data: data, max: 13,),
      )),
    );
  }
}
