import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/play_quiz_screen.dart';
import '../constant/app_colors.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

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
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )
            ),
            backgroundColor: backgroundColor,
            title: Text("Start Quiz", style: TextStyle(color: foregroundColor,fontSize: 30),),
            centerTitle: true,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Quiz App",
              style: TextStyle(
                  color: backgroundColor,
              fontSize: 45,
              fontWeight: FontWeight.w500)
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                ),
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context) => PlayQuizScreen(),
                    ),
                  );
                },
              child: Text("Start",
                style: TextStyle(
                    color: foregroundColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (
      Container(
        alignment: Alignment.center,
        height: 80,
        child: Text("Developed by TEKHED",
          style: TextStyle(
              color: backgroundColor, fontWeight: FontWeight.w500),
        ),
      )
      ),
    );
  }
}
