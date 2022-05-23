import 'package:flutter/material.dart';
import 'package:word_app/model/model_quiz.dart';
import 'package:word_app/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('My Quiz app'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/quiz.jpg',
            width: width * 0.8,
          )),
          Padding(padding: EdgeInsets.all(width * 0.024)),
          Text(
            '플러터 퀴즈 앱',
            style:
                TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          ),
          const Text(
            '퀴즈를 풀기 전 안내사항 입니다 \n 꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(width * 0.048)),
          Container(
            padding: EdgeInsets.only(bottom: width * 0.036),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.8,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RaisedButton(
                  child: Text(
                    '지금 풀기',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizScreen(
                                  quizs: quizs,
                                )));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.048, width * 0.048, width * 0.048),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Icon(
          Icons.check_box,
          size: width * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.024),
        ),
        Text(title),
      ]),
    );
  }
}
