import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/app.dart';

void main() {
  testWidgets('shows Weather Flags placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherApp());

    expect(find.text('Weather Flags'), findsWidgets);
  });
}
