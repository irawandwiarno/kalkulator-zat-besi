import 'package:kalkulator_zat_besi/pages/hasil_cek/hasil_cek_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/widget/PrimaryButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class HasilCekView extends GetView<HasilCekController> {
  const HasilCekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/vector_hai.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Kamu Membutuhkan Asupan Zat Besi Sebesar:",
                      style: MyText.title(),
                    ),
                    Gap.h10(),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/lingkaran.png",
                            width: 270,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Obx(() => Container(
                                        child: Text(
                                          "${controller.kebutuhanZatBesi.value}",
                                          style: MyText.customSize(
                                              size: 70,
                                              color: Colors.white,
                                              fontFamily: "Dangrek"),
                                        ),
                                      )),
                                  Text(
                                    "Mg",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 0.8),
                                  )
                                ],
                              ),
                              Text(
                                "Per hari",
                                style: MyText.h2(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Gap.h10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => CirceView(
                            title: controller.kebutuhanZatBesiMinggu,
                            jangka: "Per minggu",
                            fontsize: 30)),
                        Gap.w10(),
                        Obx(() => CirceView(
                            title: controller.kebutuhanZatBesiTahun,
                            jangka: "Per tahun")),
                      ],
                    ),
                    Gap.h15(),
                    Text(
                      "Ayo segera penuhi asupan zat besi mu!",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Gap.h20(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                color: MyColors.cardGrey,
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cari tau sumber zat besi mu hari ini!",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Gap.h20(),
                      PrimaryButton(title: "Cari Tahu Sekarang", onPressed: () {})
                    ],
                  ),
                ),
              ),
              Gap.h(80),
              Image.asset("assets/images/vector_heart.png")
            ],
          ),
        ),
      ),
    );
  }

  Stack CirceView({required title, required String jangka, double? fontsize}) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: MyColors.transparan,
          radius: 50, // Radius lingkaran
          child: Container(
            width: 100, // Lebar kontainer
            height: 100, // Tinggi kontainer
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[600]!, width: 2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Column(
          children: [
            Gap.h10(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${controller.formatter.format(title.value)}',
                    style: TextStyle(
                        height: 0.6,
                        fontSize: fontsize ?? 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: "Dangrek")),
                Text(
                  "Mg",
                  style: TextStyle(
                    height: 0.8,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Gap.h(3),
            Text(jangka,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))
          ],
        ),
      ],
    );
  }
}
