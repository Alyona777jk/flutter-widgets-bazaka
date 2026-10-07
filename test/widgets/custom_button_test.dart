import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_widgets_app/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton renders text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CustomButton(text: 'Submit'))));
    expect(find.text('Submit'), findsOneWidget);
  });
}
