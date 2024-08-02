import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner2_controller.dart';
import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner_controller.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class RecapPage extends StatelessWidget {
  final questionnaireController = Get.find<QuestionnaireController>();
  final questionnaireController2 = Get.find<QuestionnaireController2>();

  @override
  Widget build(BuildContext context) {
    final groupedQuestions = questionnaireController.groupQuestionsBySubBab();

    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      appBar: AppBar(
        title: Text('Recap Jawaban'),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: buildQuestionWidgets(
                groupedQuestions, questionnaireController2.questions),
          ),
        ),
      ),
    );
  }

  String nuberedAlfabet(int index) {
    return "${String.fromCharCode(65 + index)}. "; // 'B' hingga 'I'
  }

  List<Widget> buildQuestionWidgets(
      Map<String, List<Map<String, dynamic>>> groupedQuestions,
      List<Map<String, dynamic>> questions2) {
    List<Widget> result = groupedQuestions.entries.map((entry) {
      final subBab = entry.key;
      final questions = entry.value;

      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Card(
            color: Colors.white,
            elevation: 3,
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    child: Text(
                      nuberedAlfabet(
                              groupedQuestions.keys.toList().indexOf(subBab)) +
                          subBab,
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Gap.h5(),
                  ...questions.map((question) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${question["id"]}. ${question['Pernyataan']}" ?? '',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Jawaban: ${question['jawaban'] ?? 'Belum dijawab'}',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList() as List<Widget>;
    Widget result2 = SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: Get.width,
                  child: Text(
                    "Pengetahuan Mengenai Anemia",
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Gap.h5(),
                Column(
                  children: questions2.map((question){
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: question['id'] == 8 || question['id'] == 10  && question["jawaban"].isEmpty ?  Container() : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${question['soal']}" ?? '',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          question["jawaban"].isEmpty ? Card(
                            elevation: 3,
                            color: Colors.white70,
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              child: Text("Tidak Dijawab"),
                            ),
                          ) : Container(),
                          ...question["jawaban"].map<Widget>((answer) {
                            return Card(
                              elevation: 3,
                              color: Colors.white70,
                              child: Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                child: Text(answer),
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
    result.add(result2);
    result.add(Gap.h20());
    result.add(SizedBox(
      child: InkWell(
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
    ));
    result.add(Gap.h(50));
    return result;
  }
}
