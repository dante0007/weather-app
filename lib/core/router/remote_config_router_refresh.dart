import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';

/// Notifies [GoRouter] when remote-config evaluations change so redirects re-run.
class RemoteConfigRouterRefresh extends ChangeNotifier {
  StreamSubscription<dynamic>? _subscription;

  void attach(RemoteConfigBloc bloc) {
    if (_subscription != null) {
      return;
    }

    _subscription = bloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void reset() {
    _subscription?.cancel();
    _subscription = null;
  }
}
