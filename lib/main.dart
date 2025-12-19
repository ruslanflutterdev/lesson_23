import 'package:flutter/material.dart';
import 'package:lesson_21/data/question_data.dart'; // Убедитесь, что этот файл существует
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
      _screenName = 'home'; // Обычно рестарт ведет на главную или сбрасывает тест
      questionResult.clear(); // Очищаем результаты при рестарте
      currentQuestionIndex = 0; // Сбрасываем индекс вопроса
    });
  }

  void _tuResult(String answer) {
    // Добавляем результат в список
    questionResult.add(
      QuestionResultModel(
        question: questions[currentQuestionIndex].question, // Исправлено: [] вместо {}
        answers: answer,
        correctAnswer: questions[currentQuestionIndex].correctAnswer, // Исправлено: берем строку из вопроса
      ),
    );

    // Логика перехода к следующему вопросу или результатам
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _screenName = 'result';
      }
    });
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