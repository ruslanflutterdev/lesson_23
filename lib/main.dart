import 'package:flutter/material.dart';
import 'package:lesson_21/data/question_data.dart';
import 'screens/home_screen.dart';
import '../screens/question_screen.dart';
import 'models/question_result_model.dart';
import 'screens/results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _screenName = 'home';

  List<QuestionResultModel> questionResult = [];
  int currentQuestionIndex = 0;

  void _changePage() {
    setState(() {
      _screenName = 'question';
    });
  }

  void _restart() {
    setState(() {
      _screenName = 'result';
    });
  }
  void _tuResult(String answer) {
    questionResult.add((QuestionResultModel(
      question: questions{currentQuestionIndex}.question,
      answers: answer,
        correctAnswer:  currentQuestionIndex    )))
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomeScreen(
      onPressed: _changePage,
    );

    if (_screenName == 'question') {
      screen = QuestionScreen(
        onPressed: _tuResult,
      );
    }

    if (_screenName == 'result') {
      screen = ResultsScreen(
        onPressed: _restart,
        questionResult: questionResult,
      );
    }


    return Scaffold(
      body: SafeArea(
        child: screen,
      ),
    );
  }
}
