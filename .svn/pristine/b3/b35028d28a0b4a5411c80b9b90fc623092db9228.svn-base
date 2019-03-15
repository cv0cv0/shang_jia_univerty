class Question {
  Question(this.type, this.data, this.answers);

  final QuestionType type;
  final String data;
  final List<Answer> answers;
}

class Answer {
  Answer(this.data, {this.correct = false, this.selected = false});

  final String data;
  final bool correct;
  bool selected;
}

enum QuestionType {
  single_select,
  multi_select,
  judgment,
}
