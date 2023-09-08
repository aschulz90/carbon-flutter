import 'package:carbon_flutter/carbon.dart';
import 'package:example/examples/index.dart';
import 'package:example/examples/overflow.example.dart';
import 'package:example/examples/tag.example.dart';
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
                CRadioGroup<CarbonThemeData>(
                  value: theme,
                  onChanged: (value) => setState(() {
                    _theme = value;
                  }),
                  radioButtons: [
                    CRadioGroupButton(
                      value: CarbonThemeData.white(),
                      label: 'White',
                    ),
                    CRadioGroupButton(
                        value: CarbonThemeData.gray10(),
                        label: 'Gray10',
                    ),
                    CRadioGroupButton(
                        value: CarbonThemeData.gray90(),
                        label: 'Gray90',
                    ),
                    CRadioGroupButton(
                        value: CarbonThemeData.gray100(),
                        label: 'Gray100',
                    ),
                  ],
                  label: 'Theme',
                  enabled: true,
                ),
                CButton(
                  label: "Forms",
                  icon: Icon(CIcons.dataFormat),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CFormExample(),
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
                        builder: (context) => const CButtonExample(),
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
                        builder: (context) => const CTilesExample(),
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
                        builder: (context) => const CBreadcrumbExample(),
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
                        builder: (context) => const CLinkExamplePage(),
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
                        builder: (context) => const CNotificationExample(),
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
                        builder: (context) => const CCheckboxExamplePage(),
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
                        builder: (context) => const CToggleExamplePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Overflows",
                  icon: Icon(CIcons.overflowMenuHorizontal),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => COverflowExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CButton(
                  label: "Tags",
                  icon: Icon(CIcons.tag),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CTagExample(),
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
