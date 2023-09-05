import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CCheckboxExamplePage extends StatefulWidget {
  const CCheckboxExamplePage({Key? key}) : super(key: key);

  @override
  State<CCheckboxExamplePage> createState() => _CCheckboxExamplePageState();
}

class _CCheckboxExamplePageState extends State<CCheckboxExamplePage> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 64),
            CCheckbox(
              label: 'Checkbox Label',
              value: value,
              onChanged: (value) => setState(() => this.value = value ?? false),
            ),
            const SizedBox(height: 24),
            CCheckbox(
              value: value,
              onChanged: (value) => setState(() => this.value = value ?? false),
            ),
            const SizedBox(height: 24),
            CCheckbox(
              enable: false,
              label: 'Checkbox Label',
              value: value,
              onChanged: (value) => setState(() => this.value = value ?? false),
            ),
            const SizedBox(height: 24),
            CCheckbox(
              enable: false,
              value: value,
              onChanged: (value) => setState(() => this.value = value ?? false),
            ),
          ],
        ),
      ),
    );
  }
}
