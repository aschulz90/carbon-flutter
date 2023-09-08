import 'package:carbon_flutter/features/tag/index.dart';
import 'package:flutter/material.dart';

class CTagExample extends StatelessWidget {
  const CTagExample({super.key});

  List<Widget> tags({CTagSize size = CTagSize.md, enabled = true}) {
    return CTagStyle.all
        .map(
          (name, style) => MapEntry(
            name,
            CTag(
              label: name,
              style: style,
              enabled: enabled,
              size: size,
            ),
          ),
        )
        .values
        .toList();
  }

  List<Widget> filterTags({CTagSize size = CTagSize.md, enabled = true}) {
    return CTagStyle.all
        .map(
          (name, style) => MapEntry(
            name,
            CTag.filter(
              label: name,
              style: style,
              enabled: enabled,
              size: size,
              onFilterPressed: () {},
            ),
          ),
        )
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tag"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 8),
          // color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TagsExample(
                title: 'default CTag widget',
                children: tags(),
              ),
              SizedBox(height: 20),
              TagsExample(
                title: 'CTag with filter (CTag.filter)',
                children: filterTags(),
              ),
              SizedBox(height: 20),
              TagsExample(
                title: 'CTag with small size (CTag.size = CTagSize.sm)',
                children: tags(size: CTagSize.sm),
              ),
              SizedBox(height: 20),
              TagsExample(
                title: 'CTag with small size and filter',
                children: filterTags(size: CTagSize.sm),
              ),
              SizedBox(height: 20),
              TagsExample(
                title: 'CTag with disabled state (CTag.enabled = false)',
                children: [
                  CTag(
                    label: 'Disabled',
                    enabled: false,
                  ),
                  CTag.filter(
                    label: 'Disabled',
                    enabled: false,
                    onFilterPressed: () {},
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

class TagsExample extends StatelessWidget {
  const TagsExample({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
      ],
    );
  }
}
