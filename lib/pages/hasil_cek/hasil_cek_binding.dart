import 'package:kalkulator_zat_besi/pages/hasil_cek/hasil_cek_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class HasilCekBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HasilCekController());
  }
}