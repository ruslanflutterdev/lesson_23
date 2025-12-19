import 'package:flutter/material.dart';
import 'package:lesson_21/models/question_result_model.dart';
import '../widgets/panned_container.dart';
import '../widgets/question_result.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.onPressed, required this.questionResult});

  final void Function() onPressed;
  final QuestionResultModel questionResult;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PannedContainer(
        children: [
          Text('Результаты'),
          Text('1 из 10'),
          Text('Верно'),
          QuestionResult(identifier: 1, questionResult: questionResult,),
          QuestionResult(identifier: 2, questionResult: questionResult,),
          QuestionResult(identifier: 3, questionResult: questionResult,),
          QuestionResult(identifier: 4, questionResult: questionResult,),
          QuestionResult(identifier: 5, questionResult: questionResult,),
          QuestionResult(identifier: 6, questionResult: questionResult,),
          ElevatedButton(onPressed: onPressed, child: Text('Restart'))
        ],
      ),
    );
  }
}
