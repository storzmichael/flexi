import 'package:flexi/category_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CategoryCard(),
            CategoryCard(),
            CategoryCard(),
            CategoryCard(),
          ],
        )
      ],
    );
  }
}
