import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CButtonExample extends StatefulWidget {
  const CButtonExample({Key? key}) : super(key: key);

  @override
  State<CButtonExample> createState() => _CButtonExampleState();
}

class _CButtonExampleState extends State<CButtonExample> {
  CButtonSize? _size = CButtonSize.regular;

  CButtonSize get size => _size ?? CButtonSize.regular;

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
                children: [
                  Radio<CButtonSize>(
                    value: CButtonSize.regular,
                    groupValue: _size,
                    onChanged: (final value) {
                      setState(() {
                        _size = value;
                      });
                    },
                  ),
                  CText("Regular"),
                  Radio<CButtonSize>(
                    value: CButtonSize.medium,
                    groupValue: _size,
                    onChanged: (final value) {
                      setState(() {
                        _size = value;
                      });
                    },
                  ),
                  CText("Medium"),
                  Radio<CButtonSize>(
                    value: CButtonSize.small,
                    groupValue: _size,
                    onChanged: (final value) {
                      setState(() {
                        _size = value;
                      });
                    },
                  ),
                  CText("Small"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CButton(
                    label: 'Primary',
                    size: size,
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
                    size: size,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton(
                    label: 'Danger',
                    isDangerous: true,
                    size: size,
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
                    size: size,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.secondary,
                    size: size,
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
                    size: size,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.tertiary,
                    size: size,
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
                    size: size,
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
                    size: size,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    size: size,
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
                    size: size,
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
                    size: size,
                    isEnabled: false,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    size: size,
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
                    size: size,
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
