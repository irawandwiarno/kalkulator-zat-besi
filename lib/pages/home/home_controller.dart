import 'package:kalkulator_zat_besi/service/food_data.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class HomeController extends GetxController {
  List<dynamic>? dataMakanan;
  Map<String, dynamic>? dataIndexMakanan;
  List<String> listNamaMakanan = [];

  @override
  void onInit() async{
    var tempDataMakanan = await readJsonFile("food_data.json");
    var tempIndexMakanan = await readJsonFile("data_index.json");
    dataMakanan = tempDataMakanan['data'];
    dataIndexMakanan = tempIndexMakanan['data_index'];
    listNamaMakanan.clear();
    for(var makanan in dataMakanan!){
      listNamaMakanan.add(makanan["name"]);
    }

    super.onInit();
  }
}
