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
                entry: COverflowMenuEntryButton(
                  label: "Entry 1",
                  onPressed: () {},
                ),
              ),
              COverflowMenuItem(
                entry: COverflowMenuEntryButton(
                  label: "Entry 2",
                  onPressed: () {},
                ),
              ),
              COverflowMenuItem(
                entry: COverflowMenuEntryButton(
                  label: "Entry 3",
                  onPressed: () {},
                ),
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
                        entry: COverflowMenuEntryButton(
                          label: "Entry 1",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 2",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 3",
                          onPressed: () {},
                          isDangerous: true,
                          icon: Icon(CIcons.delete),
                        ),
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
                        entry: COverflowMenuEntryButton(
                          label: "Entry 1",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 2",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 3",
                          onPressed: () {},
                          isDangerous: true,
                          icon: Icon(CIcons.delete),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  COverflowMenuButton(
                    size: COverflowMenuSize.md,
                    icon: Icon(CIcons.overflowMenuVertical),
                    items: [
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 1",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 2",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 3",
                          onPressed: () {},
                          isDangerous: true,
                          icon: Icon(CIcons.delete),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  COverflowMenuButton(
                    size: COverflowMenuSize.sm,
                    icon: Icon(CIcons.overflowMenuVertical),
                    items: [
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 1",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 2",
                          onPressed: () {},
                        ),
                      ),
                      COverflowMenuItem(
                        entry: COverflowMenuEntryButton(
                          label: "Entry 3",
                          onPressed: () {},
                          isDangerous: true,
                          icon: Icon(CIcons.delete),
                        ),
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
