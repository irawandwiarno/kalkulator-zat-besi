import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/hex_color.dart';

class StickBarController extends GetxController {
  List<double> listWidgetItem = [];
  RxList<String> listItemName = <String>[].obs;

  List<Color> labelColor = [
    HexColor.code("B32222"), // Merah
    HexColor.code("FFD600"), //yelow
    HexColor.code("CE7E05"), // Oranye
    HexColor.code("53A5F0"), // Biru Muda
    HexColor.code("06B858"), // Hijau
    Colors.purple, // Ungu
    Colors.lime, // Hijau Muda
    Colors.teal, // Biru Langit
    Colors.blue[300]!, // Biru
    Colors.pink, // Pink
    Colors.brown, // Coklat
    Colors.indigo, // Indigo
    Colors.amber, // Amber
    Colors.deepOrange, // Oranye Gelap
    Colors.deepPurple, // Ungu Gelap
    Colors.lightBlue, // Biru Muda Terang
    Colors.lightGreen, // Hijau Muda Terang
    Color(0xFFD32F2F), // Deep Red
    Color(0xFF388E3C), // Green Dark
    Color(0xFF1976D2), // Indigo Dark
    Color(0xFF303F9F), // Indigo Darker
    Color(0xFFE91E63), // Pink Dark
    Color(0xFF9C27B0), // Purple Dark
    Color(0xFF673AB7), // Deep Purple
    Color(0xFF3F51B5), // Indigo
    Color(0xFF2196F3), // Blue
    Color(0xFF03A9F4), // Light Blue
  ];


  @override
  void onInit() {
    super.onInit();
  }

  String formatLongString({required String value, required int batas}){
    String displayName = value.length > batas ? '${value.substring(0, batas)}...' : value;
    return displayName;
  }

  void initLabel(List<Map<String, dynamic>> data){
    listItemName.clear();
    for(var item in data){
      print('eeee ${item.toString()}');
      listItemName.add(item['name']);
    }
    listItemName.add("Kurang");
  }

  void calculatePercentage(
      List<Map<String, dynamic>> datas, double max, double screenWidth) {
    listWidgetItem.clear();
    var totalPresentase = 0.0;
    for (var item in datas) {
      var percentage = getPercen(item, max);
      if (totalPresentase >= 100.0) {
        break;
      }
      double containerWidth;
      if (totalPresentase + percentage > 100.0) {
        containerWidth = ((100 - totalPresentase) / 100) * screenWidth;
      } else {
        containerWidth = (percentage / 100) * screenWidth;
      }

      totalPresentase += (percentage / 100);
      listWidgetItem.add(containerWidth);
    }
  }

  double getPercen(Map<String, dynamic> item, maxValue) {
    double percentage = (item['zat_besi'] / maxValue) * 100;
    return percentage;
  }
}
