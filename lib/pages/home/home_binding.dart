import 'package:kalkulator_zat_besi/pages/history/history_controller.dart';
import 'package:kalkulator_zat_besi/pages/home/home_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
 }
}