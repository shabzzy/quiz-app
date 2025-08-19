import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.restartQuiz, {super.key});
  final void Function() restartQuiz;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, //which question number
        'question': questions[i].text, // The question text
        'correct_answer':
            questions[i].answers[0], // The correct answer (first in list)
        'user_answer': chosenAnswers[i], // Whatv the user picked
      });
    }
    return summary;
    // List<Map<String, Object>> getSummaryData() => List.generate(
    //   chosenAnswers.length,
    //   (i) => {
    //     'question_index': i,
    //     'question': questions[i].text,
    //     'correct_answer': questions[i].answers[0],
    //     'user_answer': chosenAnswers[i],
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // this section is about You answered X out of Y correctly
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 203, 168, 168),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            // const Text('List of answers and questions...'),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(Icons.refresh),
              onPressed: restartQuiz,
              label: Text('Restart Quiz!', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
