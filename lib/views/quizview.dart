import 'package:flutter/material.dart';
import '/utilities/colors.dart';
import '/utilities/constants.dart';
import '/model/question_model.dart';
import 'package:quiz_app/views/resultview.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {

  final PageController pageController = PageController();

  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Quiz Game",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index){
          QuizQuestionModel model = questions[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  model.question,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height:20),
                Column(
                  children: List.generate(4, (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isAnswerLocked = true;
                          selectedAnswer = model.options[index];
                          correctAnswer = model.correctAnswer;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 4,
                            color: primaryColor,
                          ),
                          color: selectedAnswer == model.options[index] ? successColor : bgColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                model.options[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),),
                ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            if (isAnswerLocked) {
              if (selectedAnswer == correctAnswer) {
                correctAnswers++;
              } else {
                wrongAnswers++;
              }

              currentIndex++;

              if (currentIndex != questions.length) {
                pageController.jumpToPage(currentIndex);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultView(
                  correctAnswers: correctAnswers,
                  wrongAnswer: wrongAnswers,
                ),));
              }

            }
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: bgColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
