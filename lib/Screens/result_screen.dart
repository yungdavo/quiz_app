import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/play_quiz_screen.dart';
import '../constant/app_colors.dart';

class ResultScreen extends StatelessWidget {

//variables created for correct and wrong answer
int correctAnswers, wrongAnswer;

     ResultScreen({Key?key,
       required this.correctAnswers,
       required this.wrongAnswer}) : super(key : key);

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
            title: Text("Result", style: TextStyle(color: foregroundColor,fontSize: 30),),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 answerTab("Correct Answer", correctAnswers),
                 answerTab("Wrong Answer", wrongAnswer),
               ],
             ),
             ElevatedButton(
               //takes us back to PlayQuizScreen
                 onPressed: (){
                   Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (context) => PlayQuizScreen(),
                   ),
                           (route) => false,);
                 },
               style: ElevatedButton.styleFrom(backgroundColor: backgroundColor  ),
               child: Text(
                   "Take Quiz again",
                 style: TextStyle(color: foregroundColor),
               ),
             )
           ],
        ),
      ),
    );
  }


  //we created this code to avoid repetition
  Widget answerTab(String title, int value){
    return Column(
      children: [
        Text(title,
          style: TextStyle(
            color: backgroundColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text("$value",
          style: TextStyle(
            color: backgroundColor,
            fontSize: 60,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
