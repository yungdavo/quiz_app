//this is the template for the question


class QuizQuestionModel {
  final String question; //to store the questions
  final String correctAnswer; // to store the correct answers
  final List<String>options; //to store the options in a list

  QuizQuestionModel({
  required this.question,
  required this.correctAnswer,
  required this.options});

}