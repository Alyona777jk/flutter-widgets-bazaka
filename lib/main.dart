import 'package:flutter/material.dart';
import 'utils/themes.dart';
import 'utils/app_state.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppState _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical Work 5',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(appState: _appState),
    );
  }
}
