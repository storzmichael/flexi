import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  // Einzelne Fortschrittswerte
  double _progress1 = 0.7;
  double _progress2 = 0.5;
  double _progress3 = 0.8;
  double _progress4 = 0.3;

  // Getter für die Fortschrittswerte
  double get progress1 => _progress1;
  double get progress2 => _progress2;
  double get progress3 => _progress3;
  double get progress4 => _progress4;

  // Methode zum Aktualisieren eines spezifischen Fortschritts
  void updateProgress(String progressKey, double newValue) {
    switch (progressKey) {
      case 'progress1':
        _progress1 = newValue.clamp(0.0, 1.0);
        break;
      case 'progress2':
        _progress2 = newValue.clamp(0.0, 1.0);
        break;
      case 'progress3':
        _progress3 = newValue.clamp(0.0, 1.0);
        break;
      case 'progress4':
        _progress4 = newValue.clamp(0.0, 1.0);
        break;
    }
    notifyListeners(); // UI benachrichtigen
  }

  void incrementProgress(String progressKey) {
    switch (progressKey) {
      case 'progress1':
        _progress1 = ((_progress1 + 0.1).clamp(0.0, 1.0) * 10).round() / 10;
        break;
      case 'progress2':
        _progress2 = ((_progress2 + 0.1).clamp(0.0, 1.0) * 10).round() / 10;
        break;
      case 'progress3':
        _progress3 = ((_progress3 + 0.1).clamp(0.0, 1.0) * 10).round() / 10;
        break;
      case 'progress4':
        _progress4 = ((_progress4 + 0.1).clamp(0.0, 1.0) * 10).round() / 10;
        break;
    }
    notifyListeners(); // UI benachrichtigen
  }

  // Methode zum Runterzählen des Fortschritts
  void decrementProgress(String progressKey) {
    switch (progressKey) {
      case 'progress1':
        _progress1 = (progress1 - 0.1).clamp(0.0, 1.0);
        break;
      case 'progress2':
        _progress2 = (progress2 - 0.1).clamp(0.0, 1.0);
        break;
      case 'progress3':
        _progress3 = (progress3 - 0.1).clamp(0.0, 1.0);
        break;
      case 'progress4':
        _progress4 = (progress4 - 0.1).clamp(0.0, 1.0);
        break;
    }
    notifyListeners(); // UI benachrichtigen
  }
}
