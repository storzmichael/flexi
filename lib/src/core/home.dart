import 'package:flexi/src/config/config.dart';
import 'package:flexi/src/provider/navigation_provider.dart';
import 'package:flexi/src/features/dashboard/presentation/dashboard.dart';
import 'package:flexi/src/features/help/presentation/help.dart';
import 'package:flexi/src/features/settings/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Widget> pages = [Dashboard(), Help(), Settings()];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: pages[navigationProvider.currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex, // Verwendet den aktuellen Index aus dem Provider
        onTap: (index) {
          navigationProvider.setCurrentIndex(index); // Aktualisiert den Index über den Provider
        },
        showSelectedLabels: true, // Zeigt Labels für das ausgewählte Item
        showUnselectedLabels: false, // Versteckt Labels für nicht ausgewählte Items
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.help),
            icon: Icon(Icons.help_outline),
            label: 'Hilfe',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Einstellungen',
          ),
        ],
      ),
    );
  }
}
