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
      appBar: AppBar(
        title: Text("Forms"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CForm(
                type: CFormType.blank,
                actionBuilder: (context, form) {
                  return CButton(
                    label: 'Action Button',
                    onPressed: () {
                      form.validate();
                    },
                    icon: Icon(CIcons.add, size: 16),
                  );
                },
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
                        icon: Icon(Icons.error, color: CColors.red40,),
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
                        icon: Icon(Icons.warning, color: CColors.yellow20,),
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
