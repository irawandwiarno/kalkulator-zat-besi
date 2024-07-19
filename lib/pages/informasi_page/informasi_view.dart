import 'package:flutter/material.dart';
import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_view.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/PrimaryButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class InformasiView extends StatelessWidget {
  const InformasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_circle_left_outlined),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            color: Colors.white,
                            width: 230,
                            height: 48,
                            child: Image.asset(
                              "assets/images/logo.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap.h(30),
                const Text(
                  "Tahukah kamu ? ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito Sans",
                  ),
                ),
                Gap.h(5),
                const Text(
                  "Remaja remaja yang sehat merupakan investasi masa depan, karena memiliki peranan penting dalam pembangunan dan perkembangan suatu bangsa. Anemia menjadi masalah kesehatan dan beban khususnya remaja putri.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito Sans",
                  ),
                ),
                Gap.h(10),
                const Text(
                  "Anemia merupakan kondisi penyakit yang ditandai dengan kurangnya sel darah merah dalam tubuh sehingga menyebabkan kondisi lelah, letih, lesu dan berdampak pada produktivitas penderita. Prevalensi anemia pada remaja di Indonesia cukup tinggi sebesar 32 % (Riskesdas, 2018). Penanggulangan dan pencegahan anemia pada remaja putri menjadi masalah kesehatan yang difokuskan oleh pemerintah.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito Sans",
                  ),
                ),
                Gap.h(10),
                const Text(
                  "Defisiensi zat besi pada remaja putri merupakan salah satu penyebab utama anemia. Remaja putri membutuhkan lebih banyak zat besi ketika masa pertumbuhan, karena terjadi kehilangan darah saat menstruasi. Selain itu disebabkan oleh gaya hidup kebiasaan minum teh serta kopi saat makan, dan kurangnya aktifitas fisik (Kemenkes, 2018).",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito Sans",
                  ),
                ),
                Gap.h15(),
                const Center(
                  child: Text(
                    "Cek Kebutuhan Zat Besi Kamu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Nunito Sans",
                    ),
                  ),
                ),
                Gap.h10(),
                PrimaryButton(
                  title: "Mulai",
                  onPressed: () {
                    Get.toNamed(RouteName.cek);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
