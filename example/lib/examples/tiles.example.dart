import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class CTilesExample extends StatelessWidget {
  const CTilesExample({Key? key}) : super(key: key);

  Widget _layer(int num, {Widget? child}) {
    return CTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CText("LAYER $num"),
          CTextField(
            label: 'Label',
            description: 'Description',
            hint: 'Hint',
          ),
          if (child != null) child
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiles"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CText("LAYER 0"),
                CTextField(
                  label: 'Label',
                  description: 'Description',
                  hint: 'Hint',
                ),
                _layer(
                  1,
                  child: _layer(
                    2,
                    child: _layer(
                      3,
                      child: _layer(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
