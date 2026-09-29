import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Việt Nam có đường biên giới với Campuchia.', true),
    Question('Thủ đô của Việt Nam là Thành phố Hồ Chí Minh.', false),
    Question('Flutter được phát triển bởi Google.', true),
    Question('Một năm có 13 tháng.', false),
    Question('Mặt Trời mọc ở hướng Đông.', true),
    Question('Trái Đất là hành tinh thứ ba tính từ Mặt Trời.', true),
    Question('Nước đóng băng ở 100 độ C.', false),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}