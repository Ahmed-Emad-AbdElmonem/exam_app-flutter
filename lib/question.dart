import 'package:flutter/cupertino.dart';

class Question {

 late  String questionTxt;
 late String questionImage;
 late bool questionAsk;
  
  Question({required String q, required String i,required bool a }){
    questionTxt=q;
    questionImage=i;
    questionAsk=a;
  }
}