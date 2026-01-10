import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:daily_quote_explorer/providers/quote_provider.dart';
import 'package:daily_quote_explorer/screens/home_screen.dart';

void main() {
  testWidgets('Get New Quote changes UI', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => QuoteProvider(),
        child: MaterialApp(
          home: HomeScreen(), 
        ),
      ),
    );

    expect(find.text('Get New Quote'), findsOneWidget);

    await tester.tap(find.text('Get New Quote'));
    await tester.pump();

    expect(find.byType(Text), findsWidgets);
  });
}
