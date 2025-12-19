import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;

  const DecoratedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.shade900,
            Colors.purple.shade50,
          ],
        ),
        border: Border.all(
          width: 5,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: child,
    );
  }
}
