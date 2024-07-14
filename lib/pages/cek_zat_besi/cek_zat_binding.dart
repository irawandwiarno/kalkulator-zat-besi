import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class CekZatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CekZatController());
  }
}