import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  Color color;
  int height;
  int width;

  CategoryCard({
    this.color = Colors.grey,
    this.height = 40,
    this.width = 150,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
    );
  }
}
