import 'package:kalkulator_zat_besi/pages/history/history_controller.dart';
import 'package:kalkulator_zat_besi/pages/home/home_controller.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/PrimaryButton.dart';

class SearchMakananController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  HomeController homeController = Get.find<HomeController>();

  RxList<String> filteredData = <String>[].obs;

  @override
  void onInit() {
    filteredData.value = homeController.listNamaMakanan;
    super.onInit();
  }
  void filterData(String query) {
    filteredData.value = homeController.listNamaMakanan.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void selectItem({required String value}){
    _weightController.text = "1";
    _showWeightDialog(value: value);
  }

  void _showWeightDialog({required String value}) {
    Get.defaultDialog(
      title: "Masukkan Porsi Makanan",
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Porsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            PrimaryButton(title: "Simpan",  onPressed: () {
              final porsi = _weightController.text;
              if (porsi.isNotEmpty) {
                HistoryController historyController = Get.find<HistoryController>();
                  historyController.addMakanan(name: value, jumlahPorsi: double.tryParse(porsi) ?? 0);
                Get.until((route) => Get.currentRoute == RouteName.history);
              } else {
                Get.snackbar("Error", "Porsi makanan tidak boleh kosong");
              }
            },),
          ],
        ),
      ),
    );
  }
}
