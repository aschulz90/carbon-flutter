import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CButtonExample extends StatelessWidget {
  const CButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Button'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CButton(
                    label: 'Primary',
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton(
                    label: 'Danger',
                    isDangerous: true,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CButton(
                    label: 'Secondary',
                    kind: CButtonKind.secondary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.secondary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CButton(
                    label: 'Tertiary',
                    kind: CButtonKind.tertiary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.tertiary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton(
                    label: 'Danger',
                    isDangerous: true,
                    kind: CButtonKind.tertiary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CButton(
                    label: 'Ghost',
                    kind: CButtonKind.ghost,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton(
                    label: 'Danger',
                    isDangerous: true,
                    kind: CButtonKind.ghost,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CButton(
                    label: 'Disabled',
                    isEnabled: false,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    isEnabled: false,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton(
                    label: 'Danger',
                    isEnabled: false,
                    isDangerous: true,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
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
