import 'package:kalkulator_zat_besi/pages/search/search_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class SearchBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SearchMakananController());
  }
}