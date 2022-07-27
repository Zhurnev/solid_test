import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/color_app.dart';

void main() {
  testWidgets('Color changing test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ColorApp());

    // Verify that our text is present.
    expect(find.text('Hey there'), findsOneWidget);

    // Verify that our colors the starting colors
    expect(
      (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      Colors.white,
    );
    expect(
      ((tester.firstWidget(find.text('Hey there')) as Text).style)?.color,
      Colors.black,
    );

    // Tap the screen and trigger a frame.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Verify that the color has changed.
    expect(
      (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
      isNot(Colors.white),
    );
    expect(
      ((tester.firstWidget(find.text('Hey there')) as Text).style)?.color,
      isNot(Colors.black),
    );
  });
}
