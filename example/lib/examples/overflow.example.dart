import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class COverflowExample extends StatelessWidget {
  const COverflowExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overflow"),
        actions: [
          COverflowMenuButton(
            icon: Icon(CIcons.overflowMenuVertical),
            items: [
              COverflowMenuItem(
                child: CText("Entry 1"),
              ),
              COverflowMenuItem(
                child: CText("Entry 2"),
              ),
              COverflowMenuItem(
                child: CText("Entry 3"),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  COverflowMenuButton(
                    icon: Icon(CIcons.overflowMenuVertical),
                    items: [
                      COverflowMenuItem(
                        child: CText("Entry 1"),
                      ),
                      COverflowMenuItem(
                        child: CText("Entry 2"),
                      ),
                      COverflowMenuItem(
                        child: CText("Entry 3"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  COverflowMenuButton(
                    icon: Icon(CIcons.overflowMenuVertical),
                    items: [
                      COverflowMenuItem(
                        child: CText("Entry 1"),
                      ),
                      COverflowMenuItem(
                        child: CText("Entry 2"),
                      ),
                      COverflowMenuItem(
                        child: CText("Entry 3"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
