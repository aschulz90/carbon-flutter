import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CBreadcrumbExample extends StatelessWidget {
  const CBreadcrumbExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Breadcrumb'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 48),
            CBreadcrumb(
              children: [
                CBreadcrumbItem(label: 'Item 1', onTap: (_) {}),
                CBreadcrumbItem(label: 'Item 2', onTap: (_) {}),
                CBreadcrumbItem(label: 'Item 3', onTap: (_) {}),
                CBreadcrumbItem(label: 'Item 4', onTap: (_) {}),
                CBreadcrumbItem(label: 'Item 5', onTap: (_) {}),
              ],
            ),
            const SizedBox(height: 48),
            CBreadcrumb(
              children: [
                CBreadcrumbItem(label: 'Item 1', onTap: (_) {}),
                CBreadcrumbItem(label: 'Item 1', onTap: (_) {}),
                CBreadcrumbItem(
                  onTap: (_) {},
                  isCurrentPage: true,
                  label: 'Item 3',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
