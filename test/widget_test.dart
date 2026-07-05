import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/injection_container.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await sl.reset(dispose: true);
    configureDependencies();
    sl<RemoteConfigBloc>().add(const RemoteConfigEvent.started());
  });

  testWidgets('shows dashboard placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherApp());
    await tester.pump();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
