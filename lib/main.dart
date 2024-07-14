import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_binding.dart';
import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_view.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(fontFamily: "NunitoSans"),
      home: CekZatView(),
      initialBinding: CekZatBinding(),
    );
  }
}
