import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:example/examples/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      title: 'Carbon Examples',
      home: CFormExample(),
      theme: CarbonThemeData.gray10(),
      darkTheme: CarbonThemeData.white(),
      themeMode: ThemeMode.dark,
    );
  }
}
