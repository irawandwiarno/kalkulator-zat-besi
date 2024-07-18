
import 'package:url_launcher/url_launcher.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class ArtikelView extends StatelessWidget {
  const ArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isExpanded1 = false.obs;
    RxBool isExpanded2 = false.obs;
    RxBool isExpanded3 = false.obs;
    RxBool isExpanded4 = false.obs;
    RxBool isExpanded5 = false.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_circle_left_outlined),
              Text(
                "Kembali",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        leadingWidth: 110,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Artikel untuk kamu :",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: "nunito sans"),
                  ),
                ),
                Gap.h(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: 141,
                      height: 117,
                      child: Image.asset("assets/images/vector_dokter.png"),
                    ),
                    Gap.w10(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  // width: 150,
                                  child: Image.asset(
                                      "assets/images/vector_bubbleChat.png"),
                                ),
                                const Positioned.fill(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Center(
                                      child: Text(
                                        "Apa itu anemia?",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "nunito sans"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "nunito sans",
                                    color: Colors
                                        .black, // Pastikan warna teks diatur
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "Anemia merupakan kondisi medis yang terjadi ketika jumlah ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "nunito sans",
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "sel darah merah dalam tubuh lebih rendah dari jumlah normal.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "nunito sans",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap.h20(),
                // Cari tau pencegahan anemia yuk!
                InkWell(
                  onTap: () {
                    if (isExpanded2.value == true ||
                        isExpanded3.value == true ||
                        isExpanded4.value == true ||
                        isExpanded5.value == true) {
                      isExpanded2.value = false;
                      isExpanded3.value = false;
                      isExpanded4.value = false;
                      isExpanded5.value = false;
                    }
                    isExpanded1.value = !isExpanded1.value;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cari tau pencegahan anemia yuk!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunino Sans",
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() => isExpanded1.value == true
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Nunito Sans",
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Karena anemia adalah masalah kesehatan yang disebabkan ',
                                    ),
                                    TextSpan(
                                      text: 'kekurangan hemoglobin',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          ' atau sel darah merah dalam tubuh.\n\nTidak hanya karena',
                                    ),
                                    TextSpan(
                                      text: ' kekurangan zat besi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          ', anemia juga bisa disebabkan karena kekurangan: ',
                                    ),
                                    TextSpan(
                                      text: 'vitamin B12',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: ', atau juga',
                                    ),
                                    TextSpan(
                                      text: ' asam folat\n\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '1. Suplemen zat besi\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Suplemen zat besi akan diberikan pada kasus Anemia defisiensi zat besi (ADB). ADB adalah salah satu jenis anemia yang rentan terjadi pada ibu hamil dan remaja putri.\n',
                                    ),
                                    TextSpan(
                                      text: 'Suplemen zat besi dan makanan yang mengandung:\n  lebih banyak daging, kacang-kacangan, kuning telur, makanan laut, dsb.\n\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '2. Vitamin B12\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Anemia kekurangan vitamin B12 umumnya akan diatasi dengan pemberian vitamin B12. Untuk ibu hamil, vitamin B12 memiliki peran penting dalam pembentukan sel darah merah dan mencegah cacat tabung saraf pada bayi.\n',
                                    ),
                                    TextSpan(
                                      text: 'Suplemen Vitamin B12 dan makanan yang mengandung:, Daging, hati, tiram, kerang, susu, dan sebagainya.\n\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '3. Suplemen asam folat\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Salah satu fungsi asam folat adalah membentuk sel darah merah. Karena itulah seseorang yang kekurangan asam folat, produksi sel darah merahnya bisa terganggu dan menderita anemia.\n',
                                    ),
                                    TextSpan(
                                      text: 'Suplemen asam folat Makanan sumber folat, seperti sayuran berdaun hijau, gandum, susu, dan lainnya.\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Gap.h10(),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text("Penggunaan suplement sebagai asupan zat besi: ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Nunito Sans",
                                              fontStyle: FontStyle.italic
                                            ),
                                          ),
                                        ),
                                        Gap.h5(),
                                        InkWell(
                                          onTap: (){
                                            popUpAlert();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.black, width: 2,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Tanya Apoteker",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Nunito Sans",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/dokterArtikel.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                    : Container()),
                Gap.h10(),
                // Cara yang dapat dilakukan agar terbebas dari anemia?
                InkWell(
                  onTap: () {
                    if (isExpanded1.value == true ||
                        isExpanded3.value == true ||
                        isExpanded4.value == true ||
                        isExpanded5.value == true) {
                      isExpanded1.value = false;
                      isExpanded3.value = false;
                      isExpanded4.value = false;
                      isExpanded5.value = false;
                    }
                    isExpanded2.value = !isExpanded2.value;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cara yang dapat dilakukan agar terbebas dari anemia?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunino Sans",
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() => isExpanded2.value == true
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              poinDeskripsi(
                                  "Santap Sumber Zat Besi Dengan Benar Ya"),
                              poinDeskripsi(
                                  "Konsumsi Sayur Dan Buah Jangan Lupa Setiap Hari"),
                              poinDeskripsi(
                                  "Hindari Minuman Berkafein Terlalu Sering"),
                              poinDeskripsi(
                                  "Minum Tablet Penambah Darah Secara Rutin"),
                              poinDeskripsi("Terus Bergerak Secara Konsisten"),
                            ],
                          ),
                        ))
                    : Container()),
                Gap.h10(),
                // Bagaimana cara-cara pemeriksaan anemia?
                InkWell(
                  onTap: () {
                    if (isExpanded1.value == true ||
                        isExpanded2.value == true ||
                        isExpanded4.value == true ||
                        isExpanded5.value == true) {
                      isExpanded1.value = false;
                      isExpanded2.value = false;
                      isExpanded4.value = false;
                      isExpanded5.value = false;
                    }
                    isExpanded3.value = !isExpanded3.value;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bagaimana cara-cara pemeriksaan anemia?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunino Sans",
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() => isExpanded3.value == true
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bisa dilakukan dengan : ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Nunito Sans",
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:
                                    poinDeskripsi("Pemeriksaan hemoglobin/HB"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: poinDeskripsi("Pemeriksaan feritin"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: poinDeskripsi(
                                    "Pemeriksaan nilai MCH dan MCHC"),
                              ),
                              Gap.h10(),
                              const Text(
                                "Namun Kalian tidak bisa memeriksa sendiri ya, lakukan pemeriksaan ke fasilitas layanan Kesehatan.",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Nunito Sans",
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ))
                    : Container()),
                Gap.h10(),
                // Gejala yang sering terjadi pada penderita anemia dengan pemeriksaan fisik
                InkWell(
                  onTap: () {
                    if (isExpanded1.value == true ||
                        isExpanded2.value == true ||
                        isExpanded3.value == true ||
                        isExpanded5.value == true) {
                      isExpanded1.value = false;
                      isExpanded2.value = false;
                      isExpanded3.value = false;
                      isExpanded5.value = false;
                    }
                    isExpanded4.value = !isExpanded4.value;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gejala yang sering terjadi pada penderita anemia dengan pemeriksaan fisik",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunino Sans",
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() => isExpanded4.value == true
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              poinDeskripsi("Terlihat sangat lelah"),
                              poinDeskripsi(
                                  "Mengalami perubahan suasana hati "),
                              poinDeskripsi("Kulit yang terlihat lebih pucat"),
                              poinDeskripsi("Sering mengalami pusing"),
                              poinDeskripsi(
                                  "Mengalami jaundice (Mata dan kulit menjadi kuning)"),
                              poinDeskripsi(
                                  "Detak jantung berdetak lebih kencang daripada biasanya"),
                              poinDeskripsi(
                                  "Mengalami sesak nafas, sindrom kaki gelisah hingga kaki dan tangan bengkak apabila mengalami anemia berat"),
                              Gap.h10(),
                              const Text(
                                "Jika ada gejala yang dirasakan , segera cek kadar HB, perhatikan asupan zat gizi besi. Agar lebih bisa mencegah anemia, yuuk baca referensi dibawah ini",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Nunito Sans",
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ))
                    : Container()),
                Gap.h10(),
                // Referensi lainnya
                InkWell(
                  onTap: () {
                    if (isExpanded1.value == true ||
                        isExpanded2.value == true ||
                        isExpanded3.value == true ||
                        isExpanded4.value == true) {
                      isExpanded1.value = false;
                      isExpanded2.value = false;
                      isExpanded3.value = false;
                      isExpanded4.value = false;
                    }
                    isExpanded5.value = !isExpanded5.value;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Referensi lainnya",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunino Sans",
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() => isExpanded5.value == true
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListTile(
                          tileColor: Colors.white,
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                linkText(
                                    "https://www.google.com/url?q=https://journal.fkm-untika.ac.id/index.php/phj/article/download/36/43/310&usg=AOvVaw36qWsUvSUVQRP9xFvBq_dI",
                                    "https://www.google.com/url?q=https://journal.fkm-untika.ac.id/index.php/phj/article/download/36/43/310&usg=AOvVaw36qWsUvSUVQRP9xFvBq_dI"),
                                linkText(
                                    "https://ojs.unimal.ac.id/averrous/article/view/1033",
                                    "https://ojs.unimal.ac.id/averrous/article/view/1033"),
                                linkText(
                                    "https://jurnal.unismuhpalu.ac.id/index.php/MPPKI/article/view/3449",
                                    "https://jurnal.unismuhpalu.ac.id/index.php/MPPKI/article/view/3449"),
                                linkText(
                                    "https://ejurnalunsam.id/index.php/jempa/article/download/3796/2585/",
                                    "https://ejurnalunsam.id/index.php/jempa/article/download/3796/2585/"),
                                linkText(
                                    "https://ayosehat.kemkes.go.id/mengenal-gejala-anemia-pada-remaja",
                                    "https://ayosehat.kemkes.go.id/mengenal-gejala-anemia-pada-remaja"),
                              ]),
                        ))
                    : Container()),
                Gap.h20(),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    color: Colors.white,
                    width: 150,
                    // height: 48,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Gap.h20(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget poinDeskripsi(String title) {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.circle, size: 7),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "Nunito Sans",
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget linkText(String text, String url) {
    return InkWell(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: SizedBox(
          width: MediaQuery.of(Get.context!).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.circle, size: 7),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito Sans",
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void popUpAlert() {
    Get.dialog(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/comingsoon.png",
            width: 200,
          ),
          Gap.h(200)
        ],
      ),
    ));

    Future.delayed(Duration(seconds: 1), () {
      if (Get.isDialogOpen == true) {
        Get.back(); // Close the dialog
      }
    });
  }
}
