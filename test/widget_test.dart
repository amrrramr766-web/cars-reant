// Basic smoke test for the car rental app
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rent/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for any async operations
    await tester.pumpAndSettle();

    // Verify the app loads successfully
    expect(find.byType(MyApp), findsOneWidget);
  });
}
