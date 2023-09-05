import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:example/examples/index.dart';
import 'package:example/examples/tiles.example.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Carbon Design Flutter"),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CButton(
                  label: "Forms",
                  icon: Icon(Icons.format_align_center),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CFormExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Buttons",
                  icon: Icon(Icons.smart_button),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CButtonExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Tiles",
                  icon: Icon(Icons.square),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CTilesExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Breadcrumbs",
                  icon: Icon(Icons.cruelty_free),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CBreadcrumbExample(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
      theme: CarbonThemeData.gray10(),
      darkTheme: CarbonThemeData.gray90(),
      themeMode: ThemeMode.light,
    );
  }
}
