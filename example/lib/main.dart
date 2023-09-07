import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/carbon_theme.style.dart';
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
  CarbonThemeData? _theme = CarbonThemeData.white();

  CarbonThemeData get theme => _theme ?? CarbonThemeData.white();

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
                Row(
                  children: [
                    Radio<CarbonThemeData>(
                      value: CarbonThemeData.white(),
                      groupValue: _theme,
                      onChanged: (value) => setState(() {
                        _theme = value;
                      }),
                    ),
                    CText("White"),
                    Radio<CarbonThemeData>(
                      value: CarbonThemeData.gray10(),
                      groupValue: _theme,
                      onChanged: (value) => setState(() {
                        _theme = value;
                      }),
                    ),
                    CText("Gray10"),
                    Radio<CarbonThemeData>(
                      value: CarbonThemeData.gray90(),
                      groupValue: _theme,
                      onChanged: (value) => setState(() {
                        _theme = value;
                      }),
                    ),
                    CText("Gray90"),
                    Radio<CarbonThemeData>(
                      value: CarbonThemeData.gray100(),
                      groupValue: _theme,
                      onChanged: (value) => setState(() {
                        _theme = value;
                      }),
                    ),
                    CText("Gray100"),
                  ],
                ),
                CButton(
                  label: "Forms",
                  icon: Icon(CIcons.dataFormat),
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
                  icon: Icon(CIcons.shapeExcept),
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
                  icon: Icon(CIcons.account),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CBreadcrumbExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Links",
                  icon: Icon(CIcons.link),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CLinkExamplePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Notifications",
                  icon: Icon(CIcons.notification),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CNotificationExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Checkboxes",
                  icon: Icon(CIcons.checkboxChecked),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CCheckboxExamplePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Toggles",
                  icon: Icon(CIcons.checkmark),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CToggleExamplePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
      theme: theme,
    );
  }
}
