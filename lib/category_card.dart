import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final int height;
  final int width;

  const CategoryCard({
    super.key,
    this.color = Colors.grey,
    this.height = 40,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
    );
  }
}
