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
    _showWeightDialog(value: value);
  }

  void _showWeightDialog({required String value}) {
    Get.defaultDialog(
      title: "Masukkan Berat Makanan",
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (gr)',
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
              final weight = _weightController.text;
              if (weight.isNotEmpty) {
                HistoryController historyController = Get.find<HistoryController>();
                print('vvvv $value');
                  historyController.addMakanan(name: value, beratKonsumsi: double.tryParse(weight) ?? 0);
                Get.until((route) => Get.currentRoute == RouteName.history);
              } else {
                Get.snackbar("Error", "Berat makanan tidak boleh kosong");
              }
            },),
          ],
        ),
      ),
    );
  }
}
