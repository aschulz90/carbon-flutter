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
                CBreadcrumbItem(child: CText('Item 1'), onTap: () {}),
                CBreadcrumbItem(child: CText('Item 2'), onTap: () {}),
                CBreadcrumbItem(child: CText('Item 3'), onTap: () {}),
                CBreadcrumbItem(child: CText('Item 4'), onTap: () {}),
                CBreadcrumbItem(child: CText('Item 5'), onTap: () {}),
              ],
            ),
            const SizedBox(height: 48),
            CBreadcrumb(
              children: [
                CBreadcrumbItem(child: CText('Item 1'), onTap: () {}),
                CBreadcrumbItem(child: CText('Item 2'), onTap: () {}),
                CBreadcrumbItem(
                  onTap: () {},
                  isCurrentPage: true,
                  child: CText('Item 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
