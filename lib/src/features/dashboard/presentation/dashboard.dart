import 'package:flexi/src/config/config.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/category_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/challenge_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/progress_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/task_card.dart';
import 'package:flexi/src/provider/progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                color: Colors.red,
                title: schoolSubjekt1,
              ),
              CategoryCard(
                color: Colors.green,
                title: schoolSubjekt2,
              ),
              CategoryCard(
                color: Colors.blue,
                title: schoolSubjekt3,
              ),
              CategoryCard(
                color: Colors.brown,
                title: schoolSubjekt4,
              ),
            ],
          ),
          SizedBox(height: padding),
          Consumer<ProgressProvider>(
            builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressCard(
                    color: Colors.red,
                    progress: provider.progress1, // Der Fortschrittswert vom Provider
                  ),
                  ProgressCard(
                    color: Colors.green,
                    progress: provider.progress2, // Der Fortschrittswert vom Provider
                  ),
                  ProgressCard(
                    color: Colors.blue,
                    progress: provider.progress3, // Der Fortschrittswert vom Provider
                  ),
                  ProgressCard(
                    color: Colors.brown,
                    progress: provider.progress4, // Der Fortschrittswert vom Provider
                  )
                ],
              );
            },
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
                color: Colors.brown,
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
                color: Colors.brown,
              ),
            ],
          )
        ],
      ),
    );
  }
}
