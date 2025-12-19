import 'package:flutter/material.dart';
import '../widgets/decorated_container.dart';
import '../widgets/panned_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PannedContainer(
      children: [
        Image.asset(
          'assets/traffic_rules.png',
          width: 100,
        ),
        SizedBox(
          height: 30,
        ),
        DecoratedContainer(
          child: Text('Image'),
        ),
        SizedBox(
          height: 30,
        ),
        DecoratedContainer(
          child: Text('Test'),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: onPressed,
          label: Text('Go test'),
          icon: Icon(Icons.start),
        ),
      ],
    );
  }
}
