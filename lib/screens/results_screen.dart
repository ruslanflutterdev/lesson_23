import 'package:flutter/material.dart';
import 'package:lesson_21/models/question_result_model.dart'; // Убедитесь, что импорт правильный (lesson_21 или lesson_23)
import '../widgets/panned_container.dart';
import '../widgets/question_result.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onPressed,
    required this.questionResult, // Теперь это список
  });

  final void Function() onPressed;
  final List<QuestionResultModel> questionResult; // Изменили тип на List

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PannedContainer(
        children: [
          const Text('Результаты'),
          Text('${questionResult.length} из 10'), // Показываем реальное кол-во ответов
          const Text('Верно'), // (Здесь можно добавить логику подсчета верных ответов)

          // Генерируем список виджетов на основе списка результатов
          ...List.generate(questionResult.length, (index) {
            return QuestionResult(
              identifier: index + 1,
              questionResult: questionResult[index], // Берем конкретный элемент из списка
            );
          }),

          ElevatedButton(onPressed: onPressed, child: const Text('Restart'))
        ],
      ),
    );
  }
}