import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/panned_container.dart';


class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.onPressed});

  final void Function(String) onPressed;

  get firstQuestion => null;

  List<Widget> _buildQuestionAnswer(QuestionModel question) => question.answers
      .map(
        (answer) => ElevatedButton(
          onPressed: () {
            onPressed(answer);
          },
          child: Text(answer),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final question = firstQuestion;

    return PannedContainer(
      children: [
        Text('Вопрос 1 из 5'),
        Text(question.question),
        Column(
          children:
            _buildQuestionAnswer(question),
        ),
      ],
    );
  }
}
