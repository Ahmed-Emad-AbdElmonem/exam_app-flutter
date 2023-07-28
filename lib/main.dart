import 'package:exam_app/appbrain.dart';
import 'package:exam_app/question.dart';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 1, 49),
        appBar: AppBar(
          centerTitle: true,
          title: Text("اختبار"),
          backgroundColor: Color.fromARGB(255, 13, 0, 70),
        ),
        body: Exam(),
      ),
    );
  }
}

class Exam extends StatefulWidget {
  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  List<Widget> answerResult = [];
  int RightAnswer=0;


  void checkAnswer(bool whatUserPicked) {
    bool correctAnswers =appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswers) {
        RightAnswer++;
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        )
        );
      }

      if(appBrain.isFinished()==true){
 Alert(
      context: context,
      type: AlertType.success,
      title: "انتهاء الاختبار",
      desc: "لقد اجبت على $RightAnswer اسئلة صحيحة من اصل 5",
      buttons: [
        DialogButton(
          child: Text(
            "ابدأ من جديد",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();

      appBrain.reset();
      answerResult=[];
      RightAnswer=0;
      }else{
        appBrain.QuestionNext();
      }

      

    });
  }
/*
  List<String> qustions = [
    'هل هو رقم واحد',
    'هل هو رقم اتنين',
    'هل هو رقم تلاتة',
    'هل هذه تفاحة',
    'هل هذه بطيخة',
  ];

  List questionImage = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];

  List<bool> answer = [
    true,
    true,
    true,
    false,
    true,
  ];

  */

  

 

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: answerResult,
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  appBrain.getQuestionImg(),
                  width: 300,
                  height: 300,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              appBrain.getQuestionTxt(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                height: 50,
                color: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  'صح',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                textColor: const Color.fromARGB(255, 44, 3, 121),
              ),
              const SizedBox(height: 20),
              FlatButton(
                height: 50,
                color: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'خطأ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                textColor: const Color.fromARGB(255, 44, 3, 121),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
