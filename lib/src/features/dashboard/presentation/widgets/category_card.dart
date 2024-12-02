import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final double cardHeight;
  final double cardWidth;
  final double cardRadius;

  const CategoryCard({
    super.key,
    this.color = Colors.grey,
    this.cardHeight = 80,
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
            'Category',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
