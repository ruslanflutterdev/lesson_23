import 'package:flutter/material.dart';
import 'package:lesson_21/models/question_result_model.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(
      {super.key, required this.identifier, required this.questionResult});

  final int identifier;
  final QuestionResultModel questionResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.lightGreenAccent,
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            identifier.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Text(questionResult.question),
              SizedBox(
                height: 20,
              ),
              Text('Ваш ответ ${questionResult.answers}'),
              SizedBox(
                height: 20,
              ),
              Text('Правильный ответ ${questionResult.correctAnswer}'),
            ],
          ),
        ),
      ],
    );
  }
}
