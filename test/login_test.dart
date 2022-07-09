import 'package:anti_cheat_exam_app/constants/strings.dart';
import 'package:anti_cheat_exam_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Page test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Check for all widgets
    expect(find.byKey(Key(Strings.logoKey)), findsOneWidget);
    expect(find.text(Strings.idFieldHint), findsOneWidget);
    expect(find.text(Strings.passwordFieldHint), findsOneWidget);
    expect(find.text(Strings.loginButtonText), findsOneWidget);

    // Test Inputs
    const ID = "123456";
    await tester.enterText(find.byKey(Key(Strings.idFieldKey)), ID);
    expect(find.text(ID), findsOneWidget);

    const PASSWORD = "abcdefg";
    await tester.enterText(find.byKey(Key(Strings.passwordFieldKey)), PASSWORD);
    expect(find.text(PASSWORD), findsOneWidget);

    // Test Validation on Incorrect Inputs
    await tester.tap(find.byKey(Key(Strings.loginButtonKey)));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text(Strings.idFieldError), findsOneWidget);
    expect(find.text(Strings.passwordFieldError), findsOneWidget);

    // Test Validation on Correct Inputs
    const CORRECT_ID = "9876543210";
    await tester.enterText(find.byKey(Key(Strings.idFieldKey)), CORRECT_ID);
    expect(find.text(CORRECT_ID), findsOneWidget);

    const CORRECT_PASSWORD = "iuytrewq";
    await tester.enterText(
      find.byKey(Key(Strings.passwordFieldKey)),
      CORRECT_PASSWORD,
    );
    expect(find.text(CORRECT_PASSWORD), findsOneWidget);

    await tester.tap(find.byKey(Key(Strings.loginButtonKey)));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text(Strings.idFieldError), findsNothing);
    expect(find.text(Strings.passwordFieldError), findsNothing);
  });
}
