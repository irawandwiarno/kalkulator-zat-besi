import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner_controller.dart';
import 'package:kalkulator_zat_besi/pages/kuisioner/kuisioner_view.dart';
import 'package:kalkulator_zat_besi/pages/recap_kuisioner/recap_view.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class QuestionnaireController2 extends GetxController {
  var questions = <Map<String, dynamic>>[].obs;
  var currentIndex = 0.obs;
  var prevIndex = <int>[].obs;
  var isLoading = true.obs;
  var selectedAnswers = <String>[].obs;
  var selectedAnswer = ''.obs;
  ScrollController scrollController = ScrollController();

  Map<String, dynamic> get currentQuestion => questions[currentIndex.value];

  @override
  void onInit() async{
    super.onInit();
    questions.clear();
    questions.addAll(await Preferences().getJawabanPertanyaan2());

    if (questions.isEmpty) {
    loadQuestions();
    }
    historyAnswer();
    isLoading.value = false;
  }

  void loadQuestions() async {
    final jsonString = await rootBundle.loadString('assets/pertanyaan2.json');
    final jsonData = json.decode(jsonString);
    questions.value = List<Map<String, dynamic>>.from(jsonData['questions']);
    isLoading.value = false;
  }

  void resetScroll() {
    scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  void updateAnswer(String answer, bool isSelected) {
    if (isSelected) {
      selectedAnswers.add(answer);
      currentQuestion["jawaban"].add(answer);
    } else {
      selectedAnswers.remove(answer);
      currentQuestion["jawaban"].remove(answer);
    }
  }

  void updateSingleAnswer(String answer) {
    currentQuestion["jawaban"] = [answer];
    selectedAnswer.value = answer;
  }

  void cariPertanyaan(int id){
    print('ccc $id');
    var index = questions.indexWhere((question) => question['id'] == id);
    currentIndex.value = index;
  }

  void nextQuestion() async{
    prevIndex.add(currentIndex.value);
    if (currentQuestion['id'] == 9 && selectedAnswer.value != "Ya") {
      Get.to(RecapPage());
    }else if (currentQuestion['id'] == 7 && selectedAnswer.value != "Ya") {
      cariPertanyaan(9);
    }else if (currentQuestion['id'] == 10){
      Get.to(RecapPage());
    } else if (currentIndex.value < questions.length - 1) {
      print('masuk : ${currentIndex.value}');
      cariPertanyaan(currentIndex.value + 2);
    }

    await Preferences().setJawabanPertanyaan2(questions);
    resetAnswers();
    historyAnswer();
    resetScroll();
    print('prev index : ${prevIndex.toString()}');
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value = getAndRemoveLast()!;
      print('prev index : ${prevIndex.toString()}');
    } else {
      Get.off(()=>QuestionnairePage());
    }
    resetAnswers();
    historyAnswer();
    resetScroll();
  }

  bool isMultipleChoice() {
    return currentQuestion['soal'].contains('jawaban boleh lebih dari satu');
  }

  int? getAndRemoveLast() {
    print('called');
    if (prevIndex.isNotEmpty) {
      return prevIndex.removeLast();
    }
    return null; // Mengembalikan null jika daftar kosong
  }

  void historyAnswer() {
    var jawaban = currentQuestion["jawaban"];
    if (jawaban.isNotEmpty) {
      if (isMultipleChoice()) {
        selectedAnswers.clear();
        selectedAnswers.addAll(jawaban.cast<String>());
      } else {
        selectedAnswer.value = jawaban[0];
      }
    }
  }

  void resetAnswers() {
    selectedAnswers.clear();
    selectedAnswer.value = '';
  }
}
