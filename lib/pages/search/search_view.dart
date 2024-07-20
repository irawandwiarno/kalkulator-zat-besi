import 'package:kalkulator_zat_besi/pages/search/search_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/widget/TextFieldWithSatuan.dart';

class SearchView extends GetView<SearchMakananController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundApp,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Cari Makanan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              onChanged: controller.filterData,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()=>controller.selectItem(value: controller.filteredData[index]),
                      child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Text(
                            controller.filteredData[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
