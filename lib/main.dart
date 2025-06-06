import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/pages/home/home_binding.dart';
import 'package:kalkulator_zat_besi/pages/home/home_view.dart';
import 'package:kalkulator_zat_besi/pages/lockscreen/lock.dart';
import 'package:kalkulator_zat_besi/routes/app_page.dart';
import 'package:kalkulator_zat_besi/service/database/database_helper.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({ super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(fontFamily: "NunitoSans"),
      home: HomeView(),
      getPages: AppPages.pages,
      initialBinding:HomeBinding(),
    );
  }
}
