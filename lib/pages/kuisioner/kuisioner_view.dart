import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';
import 'package:kalkulator_zat_besi/widget/SecondButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class QuestionnairePage extends StatelessWidget {
  final questionnaireController = Get.put(QuestionnaireController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (questionnaireController.isLoading.value) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Loading...'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      final currentQuestion = questionnaireController.currentQuestion;
      final subBab = questionnaireController.subBab;

      return Scaffold(
        backgroundColor: MyColors.backgroundApp,
        appBar: AppBar(
          title: Text(
            "Kuisioner",
            style: MyText.h2(),
          ),
          centerTitle: true,
          elevation: 3,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Card(
                color: Colors.white,
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subBab,
                        style: MyText.h3(),
                      ),
                      Divider(),
                      Gap.h10(),
                      Text(
                        currentQuestion['Pernyataan'] ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                      Gap.h20(), // Mengganti Gap.h5()
                      GestureDetector(
                        onTap: () {
                          questionnaireController.updateAnswer('Setuju');
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 3,
                          child: Container(
                            child: Row(
                              children: [
                                Radio<String>(
                                  activeColor: MyColors.primaryColor,
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                  value: 'Setuju',
                                  groupValue: currentQuestion['jawaban'],
                                  onChanged: (value) {
                                    questionnaireController.updateAnswer(value);
                                  },
                                ),
                                Text('Setuju'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap.h5(),
                      GestureDetector(
                        onTap: () {
                          questionnaireController.updateAnswer('Tidak Setuju');
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 3,
                          child: Container(
                            child: Row(
                              children: [
                                Radio<String>(
                                  activeColor: MyColors.primaryColor,
                                  value: 'Tidak Setuju',
                                  groupValue: currentQuestion['jawaban'],
                                  onChanged: (value) {
                                    questionnaireController.updateAnswer(value);
                                  },
                                ),
                                Text('Tidak Setuju'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                width: Get.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ExpandedButton(
                      onPressed: questionnaireController.previousQuestion,
                      title: "Back",
                      color: Color(0xFFE7E7E7),
                    ),
                    Gap.w10(),
                    ExpandedButton(
                      onPressed: questionnaireController.nextQuestion,
                      title: "Next",
                      gradientButton: true,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
