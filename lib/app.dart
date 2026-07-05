import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Flags',
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather Flags')),
        body: const Center(child: Text('Weather Flags')),
      ),
    );
  }
}
