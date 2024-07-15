import 'package:get/get.dart';
import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_view.dart';
import 'package:kalkulator_zat_besi/pages/hasil_cek/hasil_cek_binding.dart';
import 'package:kalkulator_zat_besi/pages/hasil_cek/hasil_cek_view.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';

class AppPages {
  static final pages = [
    // GetPage(
    //   name: RouteName.home,
    //   page: () => HomePage(),
    // ),
    GetPage(
      name: RouteName.cek,
      page: () => CekZatView(),
    ),
    GetPage(
      name: RouteName.result,
      page: () => HasilCekView(),
      binding: HasilCekBinding(),
    ),
  ];
}
