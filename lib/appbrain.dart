import 'package:exam_app/question.dart';

class AppBrain {
  int _questionNumber = 0;
 final List<Question> _questionGroup = [
    Question(q: 'هل هو رقم واحد', i: 'assets/1.png', a: true),
    Question(q: 'هل هو رقم اتنين', i: 'assets/2.png', a: true),
    Question(q: 'هل هو رقم تلاتة', i: 'assets/3.jpg', a: true),
    Question(q: 'هل هذه تفاحة', i: 'assets/4.jpg', a: false),
    Question(q: 'هل هذه بطيخة', i: 'assets/5.jpg', a: true),
  ];

  void QuestionNext(){

    if (_questionNumber<_questionGroup.length - 1){
      _questionNumber++;

    }
  }

  String getQuestionTxt( ){
    return _questionGroup[_questionNumber].questionTxt;
  }

  String getQuestionImg(){
    return _questionGroup[_questionNumber].questionImage; 
  }

  bool getQuestionAnswer(){
    return _questionGroup[_questionNumber].questionAsk; 
  }

  bool isFinished (){

    if (_questionNumber>=_questionGroup.length - 1){
      return true;

    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber=0;
  }
  
}
