import 'package:flutter/widgets.dart';

import 'action_button.widget.dart';
import 'notification.widget.dart';

class NotificationAction {
  final VoidCallback onTap;
  final String label;

  NotificationAction({
    required this.onTap,
    required this.label,
  });
}

class CNotificationBaseProps {
  /// The title to display.
  final Widget title;

  /// The subtitle to display.
  final Widget subtitle;

  /// The state that the [CNotification] represents. It can be `error`,
  /// `info`, `success`, or `warning`.
  final CNotificationKind kind;

  /// Whether you are using the low contrast variant of the [CNotification].
  final CNotificationContrast contrast;

  /// Called when the close button is tapped.
  final VoidCallback? onCloseButtonTap;

  /// Called after the given [timeout] duration has passed.
  final VoidCallback? onClose;

  /// An optional duration (milliseconds) to determine the amount of time
  /// the [CNotification] should be displayed.
  ///
  /// When the duration is finished, [onClose] is called.
  final int? timeout;

  /// A list of [CNotificationActionButton] to display.
  final List<NotificationAction>? actions;

  CNotificationBaseProps({
    required this.title,
    required this.subtitle,
    required this.kind,
    required this.contrast,
    required this.onCloseButtonTap,
    required this.onClose,
    required this.timeout,
    this.actions,
  });
}

class CNotificationToastProps extends CNotificationBaseProps {
  /// An optional caption to display.
  final Widget? caption;

  CNotificationToastProps({
    required this.caption,
    required super.title,
    required super.subtitle,
    required super.kind,
    required super.contrast,
    required super.onCloseButtonTap,
    required super.onClose,
    required super.timeout,
    super.actions,
  });
}

class CNotificationInlineProps extends CNotificationBaseProps {

  CNotificationInlineProps({
    required super.title,
    required super.subtitle,
    required super.kind,
    required super.contrast,
    required super.onCloseButtonTap,
    required super.onClose,
    required super.timeout,
    super.actions,
  });
}
