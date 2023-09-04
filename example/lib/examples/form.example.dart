import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CFormExample extends StatefulWidget {
  const CFormExample({Key? key}) : super(key: key);

  @override
  State<CFormExample> createState() => _CFormExampleState();
}

class _CFormExampleState extends State<CFormExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CForm(
                type: CFormType.group,
                action: CButton(
                  label: 'Action Button',
                  onTap: () {

                  },
                  icon: Icon(CIcons.add, size: 16),
                ),
                children: [
                  CTextField(
                    label: 'Label',
                    hint: 'Hint',
                    description: 'Description',
                  ),
                  const SizedBox(height: 16),
                  CTextField(
                    label: 'Label',
                    hint: 'Hint',
                    description: 'Description',
                    validator: (value) {
                      return CValidationResult(
                        kind: CValidationKind.error,
                        message: 'Your input is incorrect',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CTextField(
                    label: 'Label',
                    hint: 'Hint',
                    description: 'Description',
                    validator: (value) {
                      return CValidationResult(
                        kind: CValidationKind.success,
                        message: 'Your input is correct.',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CTextField(
                    label: 'Label',
                    hint: 'Hint',
                    description: 'Description',
                    validator: (value) {
                      return CValidationResult(
                        kind: CValidationKind.warning,
                        message: 'Your input is missing something.',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CTextField(
                    label: 'Label',
                    hint: 'Hint',
                    description: 'Description',
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
