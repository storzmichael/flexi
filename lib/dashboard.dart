import 'package:flexi/category_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Platzhalter
        SizedBox(
          height: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryCard(
              color: Colors.red,
            ),
            CategoryCard(),
            CategoryCard(),
            CategoryCard(),
          ],
        )
      ],
    );
  }
}
