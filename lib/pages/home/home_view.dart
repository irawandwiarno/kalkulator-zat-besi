import 'package:flutter/material.dart';
import 'package:kalkulator_zat_besi/pages/artikel_page/artikel_view.dart';
import 'package:kalkulator_zat_besi/pages/informasi_page/informasi_view.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/widget/HomeButton.dart';
import 'package:kalkulator_zat_besi/widget/PrimaryButton.dart';
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
                        PrimaryButton(
                            title: "Cek kebutuhan zat gizi",
                            rounded: 21,
                            contentPadding: 10,
                            onPressed: () {
                              Get.toNamed(RouteName.info);
                            }),
                        Gap.h10(),
                        OutlineGradientButton(
                            title: "Daftar asupan zat gizi",
                            onPressed: () async {
                              var kebutuhanIron =
                                  await Preferences().getZatBesi();
                              if (kebutuhanIron == 0.0) {
                                Get.toNamed(RouteName.cek);
                              } else {
                                Get.toNamed(RouteName.history);
                              }
                            },
                            type: 2),
                        Gap.h20(),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.artikel);
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
