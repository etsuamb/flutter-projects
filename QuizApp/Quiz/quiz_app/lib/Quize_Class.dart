class Quize {
  String? questions;
  bool? answers;

  var quizeBank;
  Quize(this.questions, this.answers);
  String getQuestion() {
    return questions!;
  }

  bool getAnswers() {
    return answers!;
  }
}
