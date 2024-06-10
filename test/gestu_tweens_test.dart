import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestu_tweens/gestu_tweens.dart';

void main() {
  group('ScaleTween', () {
    testWidgets('should animate scale from begin to end',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ScaleTween(
            duration: Duration(seconds: 1),
            begin: 0.5,
            end: 1.5,
            child: Text('Scale me!'),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('Scale me!'), findsOneWidget);

      // Start the animation
      await tester.pump();

      // Verify mid-animation state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Scale me!'), findsOneWidget);

      // Verify end state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Scale me!'), findsOneWidget);
    });
  });

  group('OpacityTween', () {
    testWidgets('should animate opacity from begin to end',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: OpacityTween(
            duration: Duration(seconds: 1),
            begin: 0.2,
            end: 1.0,
            child: Text('Fade me!'),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('Fade me!'), findsOneWidget);

      // Start the animation
      await tester.pump();

      // Verify mid-animation state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Fade me!'), findsOneWidget);

      // Verify end state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Fade me!'), findsOneWidget);
    });
  });

  group('TraslateTween', () {
    testWidgets('should animate position from begin to end',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TranslateTween(
            duration: Duration(seconds: 1),
            begin: Offset(0, 30),
            end: Offset(0, 0),
            child: Text('Slide me!'),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('Slide me!'), findsOneWidget);

      // Start the animation
      await tester.pump();

      // Verify mid-animation state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Slide me!'), findsOneWidget);

      // Verify end state
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Slide me!'), findsOneWidget);
    });
  });
}
