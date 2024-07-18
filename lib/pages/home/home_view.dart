import 'package:flutter/material.dart';
import 'package:kalkulator_zat_besi/pages/artikel_page/artikel_view.dart';
import 'package:kalkulator_zat_besi/pages/informasi_page/informasi_view.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/widget/HomeButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 230,
                  height: 48,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 39,
                          height: 39,
                          child: Image.asset("assets/images/logo_kampus.png"),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Presented by",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "nunito sans"),
                            ),
                            Text(
                              "Universitas Al-Ghifari",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "nunito sans"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomeButton(
                            title: "Cek kebutuhan zat gizi",
                            onPressed: () {
                              Get.to(() => const InformasiView());
                            },
                            type: 1),
                        Gap.h(10),
                        HomeButton(
                            title: "Daftar asupan zat gizi",
                            onPressed: () {},
                            type: 2),
                        Gap.h(20),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ArtikelView());
                          },
                          child: const Text(
                            "Baca Artikel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "nunito sans",
                              color: MyColors.textLink,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
