import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/widget/SecondButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class DaftarMakanan extends StatelessWidget {
  DaftarMakanan({super.key});

  var indexFoto = 1.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.backgroundApp,
          appBar: AppBar(
            title: Text(
              "Daftar Makanan",
              style: MyText.h3(),
            ),
            elevation: 3,
          ),
          body: Obx(
            () => Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: Get.width,
                  child: Image.asset("assets/images/daftar/${indexFoto.value}.png",
                      fit: BoxFit.fitWidth),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        ExpandedButton(
                          onPressed: () {
                            if (indexFoto.value > 1) {
                              indexFoto--;
                            }
                          },
                          title: "Back",
                          color: Color(0xFFE7E7E7),
                        ),
                        Gap.w10(),
                        ExpandedButton(
                          onPressed: () {
                            if (indexFoto.value < 7) {
                              indexFoto++;
                            }
                            print('foto $indexFoto');
                          },
                          title: "Next",
                          gradientButton: true,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: Get.height,)
              ],
            ),
          )),
    );
  }
}
