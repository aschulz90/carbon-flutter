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
  final primaryColor = CarbonStateColor(
    color: CColors.green60,
    hoveredColor: CColors.green70,
    focusedColor: CColors.green70,
    pressedColor: CColors.green80,
  );

  CarbonThemeData? _theme = CarbonThemeData.white();

  CarbonThemeData get theme => (_theme ?? CarbonThemeData.white()).withPrimaryColor(primaryColor);

  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      title: 'Carbon Examples',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Carbon Design Flutter"),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    SizedBox(
                      height: 16,
                    ),
                    CButton(
                      label: "Forms",
                      icon: Icon(CIcons.dataFormat),
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CTagExample(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      theme: theme,
    );
  }
}
