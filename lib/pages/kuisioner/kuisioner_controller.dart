import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner2_view.dart';
import 'package:kalkulator_zat_besi/pages/recap_kuisioner/recap_view.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class QuestionnaireController extends GetxController {
  var questions = <Map<String, dynamic>>[].obs;
  var currentIndex = 0.obs;
  var isLoading = true.obs;
  Map<String, dynamic> get currentQuestion => questions[currentIndex.value];
  String get subBab => currentQuestion['sub_bab'] ?? '';

  @override
  void onInit() async {
    super.onInit();
    questions.clear();
    questions.addAll(await Preferences().getJawabanPertanyaan1());

    if (questions.isEmpty) {
      loadQuestions();
    }
    isLoading.value = false;
  }

  void loadQuestions() async {
    final jsonString = await rootBundle.loadString('assets/pertanyaan1.json');
    final jsonData = json.decode(jsonString);
    questions.value = List<Map<String, dynamic>>.from(jsonData['data']);
    isLoading.value = false;
  }

  void updateAnswer(String? value) {
    questions[currentIndex.value]['jawaban'] = value;
    questions.refresh();
  }

  void nextQuestion() async {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    } else {
      Get.off(QuestionnairePage2());
    }
      await Preferences().setJawabanPertanyaan1(questions);
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  Map<String, List<Map<String, dynamic>>> groupQuestionsBySubBab() {
    Map<String, List<Map<String, dynamic>>> groupedQuestions = {};
    for (var question in questions) {
      String subBab = question['sub_bab'] ?? 'Lainnya';
      if (groupedQuestions[subBab] == null) {
        groupedQuestions[subBab] = [];
      }
      groupedQuestions[subBab]!.add(question);
    }
    return groupedQuestions;
  }
}
