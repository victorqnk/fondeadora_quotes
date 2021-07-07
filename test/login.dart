import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora/views/login.dart';

void main() {
  testWidgets('login form', (WidgetTester tester) async {
    // find elements
    final email = find.byKey(ValueKey('email'));
    final button = find.byType(ElevatedButton);
    // execute tests
    await tester.pumpWidget(MaterialApp(home: Login()));
    await tester.enterText(email, 'test@email.com');
    await tester.tap(button);
    await tester.pump();
    // check outputs
    expect(find.text('test@email.com'), findsOneWidget);
  });
}
