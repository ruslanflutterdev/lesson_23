import 'package:flutter/material.dart';

class PannedContainer extends StatelessWidget {
  final List<Widget> children;

  const PannedContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
