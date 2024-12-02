import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final double cardHeight;
  final double cardWidth;
  final double cardRadius;

  const TaskCard({
    super.key,
    this.color = Colors.grey,
    this.cardHeight = 350,
    this.cardWidth = 220,
    this.cardRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Center(
          child: Text(
            'Tasks',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
