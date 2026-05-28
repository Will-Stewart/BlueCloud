import 'package:flutter/material.dart';
import 'src/config/app_theme.dart';
import 'src/features/app_shell/app_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blue Cloud',
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}