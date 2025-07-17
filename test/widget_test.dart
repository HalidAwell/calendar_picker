import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calendar_picker/main.dart';

void main() {
  testWidgets('Calendar Picker opens and selects a date', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify the 'Select Date' button exists
    expect(find.text('Select Date'), findsOneWidget);

    // Tap the button to open the calendar picker
    await tester.tap(find.text('Select Date'));
    await tester.pumpAndSettle(); // Wait for dialog to open

    // Tap a date inside the calendar (assumes calendar has a 15th day visible)
    expect(find.text('15'), findsWidgets);
    await tester.tap(find.text('15').first);
    await tester.pumpAndSettle(); // Wait for selection animation

    // Tap OK to confirm date selection
    expect(find.text('OK'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Wait for dialog to close

    // Verify the selected date is displayed
    expect(find.textContaining('Selected Date'), findsOneWidget);
  });
}
