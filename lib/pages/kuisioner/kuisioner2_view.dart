import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner2_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/colors.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/widget/SecondButton.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';

class QuestionnairePage2 extends StatelessWidget {
  final questionnaireController = Get.put(QuestionnaireController2(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() {
        if (questionnaireController.isLoading.value) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Loading...'),
              elevation: 3,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final currentQuestion = questionnaireController.currentQuestion;

        return Scaffold(
          backgroundColor: MyColors.backgroundApp,
          appBar: AppBar(
            title: Text("Kuisioner",
              style: MyText.h2(),),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pengetahuan Mengenai Anemia",
                      style: MyText.h3(),
                    ),
                    Divider(),
                    Gap.h10(),
                    Text(
                      currentQuestion['soal'] ?? '',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView.builder(
                          controller: questionnaireController.scrollController,
                          padding: EdgeInsets.only(bottom: 50),
                          itemCount: currentQuestion['pilihan'].length,
                          itemBuilder: (context, index) {
                            final pilihan = currentQuestion['pilihan'][index];
                            final isMultipleChoice =
                                questionnaireController.isMultipleChoice();

                            if (isMultipleChoice) {
                              return Obx(
                                () => Card(
                                  color: Colors.white70,
                                  child: CheckboxListTile(
                                    activeColor: MyColors.primaryColor,
                                    title: Text(pilihan),
                                    value: questionnaireController
                                        .selectedAnswers
                                        .contains(pilihan),
                                    onChanged: (bool? value) {
                                      questionnaireController.updateAnswer(
                                          pilihan, value!);
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return Obx(
                                () => Card(
                                  color: Colors.white70,
                                  child: RadioListTile<String>(
                                    activeColor: MyColors.primaryColor,
                                    title: Text(pilihan),
                                    value: pilihan,
                                    groupValue: questionnaireController
                                        .selectedAnswer.value,
                                    onChanged: (String? value) {
                                      questionnaireController
                                          .updateSingleAnswer(value!);
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
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
    ]);
  }
}
