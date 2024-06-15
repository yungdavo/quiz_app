import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import 'package:quiz_app/constant/quiz_questions.dart';
import 'package:quiz_app/question_model/quiz_question_model.dart';
import '../constant/app_colors.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {

  //variables we created for specific functions

  bool isAnswerSelected = false; // this allows us select options, it is set to false cos no option is selected at first
  int currentIndex = 0, correctAnswers = 0, wrongAnswer = 0; //correctAnswers stores correct answer and wrong answer stores wrong answer
  String correctAnswer = "", selectedAnswer = ""; // this validates if the selected answer rhymes with the correct answer
  final PageController pageController = PageController(); //this is controls the the properties of the pageView.builder


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: foregroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: AppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )
              ),
              iconTheme: IconThemeData(color: foregroundColor, size: 30),
              backgroundColor: backgroundColor,
              title: Text("Play Quiz", style: TextStyle(color: foregroundColor,fontSize: 30),),
              centerTitle: true,
            ),
          ),
        ),

      body: PageView.builder(//we created the pageView.builder to create more pages for our questions and options.
        controller: pageController,
          physics: NeverScrollableScrollPhysics(), //this locks the pages from sliding left or right
          //itemCount is for the number of pages to be created
          itemCount: quizQuestions.length, //This shows the amount of questions from the qui
          //item builder takes context, index [ we returned the cut container in this bracket]
          itemBuilder: (context, index){

            QuizQuestionModel model = quizQuestions[index]; //this extracts the questions from the model

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.topLeft, // wrapped the text with align, to shift it left
                    child: Text(
                      model.question, //this shows our questions from the model
                      style: TextStyle(color: backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,), // gives space between the the questions and options
                  Column(
                    children: List.generate( //we cut the container and created a list.generate function and pasted it in the null
                      model.options.length, //this shows the length of our options, we added .length because it's in a list
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell( //we wrapped the the option container in inkwell to make it tappable
                          onTap: (){
                            setState(() { //setState lets us see this functions in real time
                              isAnswerSelected = true; //allows our options to be selected
                              selectedAnswer = model.options[index]; //this stores the position of the selected option
                              correctAnswer = model.correctAnswer; // this stores the correct answer as set from the model
                            });
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: backgroundColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: selectedAnswer == model.options[index] ? foregroundColor : backgroundColor,
                              //if selected answer is equal to model.options[index] there will be no effect, otherwise show backGround color
                            ),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(13),
                            child: Text(
                              model.options[index], //shows our options, we added [index] because the options has positions
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

      bottomNavigationBar: InkWell(
        onTap: (){
          //if answer isn't locked, don't go to next page
              if (isAnswerSelected) {
                //if selected answer is correct then increase the number of corrected answer
                if(selectedAnswer == correctAnswer){
                    correctAnswers++;
                }else {
                  //else increase the number of wrong answer
                  wrongAnswer++;
                }
                //whatever answer is selected increase the the current index, this helps navigate to the next page
                currentIndex++;
                  //if the currentIndex has gotten to the end of the length, show result screen
                if (currentIndex != quizQuestions.length){
                  pageController.jumpToPage(currentIndex); //this allows us move to the next page after answer is selected
                }else{
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => ResultScreen(
                          //displays the answers in the result screen
                    correctAnswers: correctAnswers,
                    wrongAnswer: wrongAnswer,
                      ),
                    ),
                  );
                }

                print("Correct Answers : $correctAnswers");
                print("Wrong Answers : $wrongAnswer");

              } else {

                print("Select an option");

              }
        },
        child: Container(
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 30),
            ],
          ),
          child: Text("Continue",
          style: TextStyle(
            color: foregroundColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
