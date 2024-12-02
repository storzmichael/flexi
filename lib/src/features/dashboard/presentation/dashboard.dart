import 'package:flexi/config.dart';
import 'package:flexi/widgets/category_card.dart';
import 'package:flexi/widgets/challenge_card.dart';
import 'package:flexi/widgets/progress_card.dart';
import 'package:flexi/widgets/task_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Platzhalter
          const SizedBox(
            height: 200,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                color: Colors.red,
              ),
              CategoryCard(
                color: Colors.green,
              ),
              CategoryCard(
                color: Colors.blue,
              ),
              CategoryCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressCard(
                color: Colors.red,
              ),
              ProgressCard(
                color: Colors.green,
              ),
              ProgressCard(
                color: Colors.blue,
              ),
              ProgressCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskCard(
                color: Colors.red,
              ),
              TaskCard(
                color: Colors.green,
              ),
              TaskCard(
                color: Colors.blue,
              ),
              TaskCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChallengeCard(
                color: Colors.red,
              ),
              ChallengeCard(
                color: Colors.green,
              ),
              ChallengeCard(
                color: Colors.blue,
              ),
              ChallengeCard(
                color: Colors.purple,
              ),
            ],
          )
        ],
      ),
    );
  }
}
