import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class HasilCekController extends GetxController {

  RxDouble kebutuhanZatBesi = 0.0.obs;
  RxDouble kebutuhanZatBesiMinggu = 0.0.obs;
  RxDouble kebutuhanZatBesiTahun = 0.0.obs;

  var formatter = NumberFormat('#,##0', 'id_ID');


  @override
  void onInit() async {
    kebutuhanZatBesi.value = await Preferences().getZatBesi() ?? 0.0;
    print('$kebutuhanZatBesi');
    kebutuhanZatBesiMinggu.value = kebutuhanZatBesi.value * 7;
    kebutuhanZatBesiTahun.value = kebutuhanZatBesi.value *365;
    super.onInit();
  }
}
