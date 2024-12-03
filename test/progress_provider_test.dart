import 'package:flexi/src/provider/progress_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProgressProvider Tests', () {
    test('Initial progress1 value is 0.7', () {
      final progressProvider = ProgressProvider();
      expect(progressProvider.progress1, 0.7);
    });

    test('updateProgress updates progress1 correctly', () {
      final progressProvider = ProgressProvider();
      progressProvider.updateProgress('progress1', 0.8);
      expect(progressProvider.progress1, 0.8);
    });

    test('incrementProgress increases progress1 by 0.1', () {
      final progressProvider = ProgressProvider();
      progressProvider.incrementProgress('progress1');
      expect(progressProvider.progress1, 0.8); // Überprüfe nach dem Inkrement
    });

    test('decrementProgress decreases progress1 by 0.1', () {
      final progressProvider = ProgressProvider();
      progressProvider.decrementProgress('progress1');
      expect(progressProvider.progress1, 0.6); // Überprüfe nach dem Dekrement
    });
  });
}
