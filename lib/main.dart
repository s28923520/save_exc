import 'package:flutter/material.dart';
import 'edit.dart';

ThemeData mainTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 68, 103, 155))
);

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('表單'),
        ),
        body: Editform(),
      ),
    );
  }
}
