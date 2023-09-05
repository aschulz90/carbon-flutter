import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CNotificationExample extends StatefulWidget {
  const CNotificationExample({Key? key}) : super(key: key);

  @override
  State<CNotificationExample> createState() => _CNotificationExampleState();
}

class _CNotificationExampleState extends State<CNotificationExample> {
  bool isHighContrast = false;

  CNotificationContrast get contrast => isHighContrast ? CNotificationContrast.high : CNotificationContrast.low;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.present_to_all_sharp)),
              Tab(icon: Icon(Icons.cancel_presentation)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isHighContrast = !isHighContrast;
                });
              },
              icon: Icon(
                Icons.contrast,
                color: isHighContrast ? Colors.green : null,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 48),
                  CText(
                    'Toast notification',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        contrast: contrast,
                        title: CText('Notification title'),
                        subtitle: CText('Subtitle text goes here.'),
                        caption: CText('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        contrast: contrast,
                        kind: CNotificationKind.error,
                        title: CText('Notification title'),
                        subtitle: CText('Subtitle text goes here.'),
                        caption: CText('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        contrast: contrast,
                        kind: CNotificationKind.warning,
                        title: CText('Notification title'),
                        subtitle: CText('Subtitle text goes here.'),
                        caption: CText('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        contrast: contrast,
                        kind: CNotificationKind.success,
                        title: CText('Notification title'),
                        subtitle: CText('Subtitle text goes here.'),
                        caption: Row(
                          children: [
                            CButton(
                              label: 'Action',
                              onTap: () {},
                              kind: CButtonKind.tertiary,
                              style: isHighContrast ? tertiaryDark : tertiaryLight,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 24),
                  CText(
                    'Inline notification',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CNotification.inline(
                          onCloseButtonTap: () {},
                          contrast: contrast,
                          title: CText('Notification title'),
                          subtitle: CText('Subtitle text goes here.'),
                          actions: [
                            NotificationAction(label: 'Action', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CNotification.inline(
                          onCloseButtonTap: () {},
                          contrast: contrast,
                          title: CText('Notification title'),
                          subtitle: CText('Long text. Long text. Long text. Long text. Long text. Long text. Long text. Long text.'),
                          actions: [
                            NotificationAction(label: 'Action', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CNotification.inline(
                          onCloseButtonTap: () {},
                          contrast: contrast,
                          kind: CNotificationKind.error,
                          title: CText('Notification title'),
                          subtitle: CText('Subtitle text goes here.'),
                          actions: [
                            NotificationAction(label: 'Action', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CNotification.inline(
                          onCloseButtonTap: () {},
                          contrast: contrast,
                          kind: CNotificationKind.warning,
                          title: CText('Notification title'),
                          subtitle: CText('Subtitle text goes here.'),
                          actions: [
                            NotificationAction(label: 'Action', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CNotification.inline(
                          onCloseButtonTap: () {},
                          contrast: contrast,
                          kind: CNotificationKind.success,
                          title: CText('Notification title'),
                          subtitle: CText('Subtitle text goes here.'),
                          actions: [
                            NotificationAction(label: 'Action', onTap: () {}),
                          ],
                        ),
                      ],
                    ),
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
