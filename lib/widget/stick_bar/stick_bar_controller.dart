import 'package:kalkulator_zat_besi/shared/package.dart';

class StickBarController extends GetxController {
  List<double> listContainerItem = [];

  List<Color> labelColor = [
    Colors.red, // Merah
    Colors.yellow, // Kuning
    Colors.orange, // Oranye
    Colors.cyan, // Biru Muda
    Colors.green, // Hijau
    Colors.blue, // Biru
    Colors.purple, // Ungu
    Colors.lime, // Hijau Muda
    Colors.teal, // Biru Langit
    Colors.pink, // Pink
  ];

  @override
  void onInit() {
    super.onInit();
  }

  // List<Widget> getBar(
  //     {required List<Map<String, dynamic>> datas,
  //     required double max,
  //     required double screenWidth}) {
  //   calculatePercentage(datas, max, screenWidth);
  //   return listContainerItem;
  // }

  void calculatePercentage(
      List<Map<String, dynamic>> datas, double max, double screenWidth) {
    listContainerItem.clear();
    var totalPresentase = 0.0;
    for (var item in datas) {
      print('p');
      var percentage = getPercen(item, max);
      if (totalPresentase >= 100.0) {
        break;
      }
      double containerWidth;
      if (totalPresentase + percentage > 100.0) {
        containerWidth = ((1.0 - totalPresentase) / 100) * screenWidth;
      } else {
        containerWidth = (percentage / 100) * screenWidth;
      }

      totalPresentase += (percentage / 100);
      // Menambahkan Container ke listContainerItem dengan lebar yang dihitung
      listContainerItem.add(containerWidth);
    }
  }

  double getPercen(Map<String, dynamic> item, maxValue) {
    double percentage = (item['zat_besi'] / maxValue) * 100;
    return percentage;
  }
}
