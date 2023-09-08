import 'package:carbon_flutter/features/button/button.widget.dart';
import 'package:carbon_flutter/features/theme/index.dart';
import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

import 'notification.props.dart';
import 'notification.styles.dart';

enum CNotificationKind { error, info, success, warning }

enum CNotificationType { inline, toast }

enum CNotificationContrast { high, low }

typedef _Styles = CNotificationStyles;
typedef _Assets = CNotificationAssets;

/// Notifications are messages that communicate information to the user.
///
/// The two main variants of notifications are toast notifications and
/// inline notifications.
class CNotification extends StatelessWidget {
  CNotification.toast({
    Key? key,
    required Widget title,
    required Widget subtitle,
    Widget? caption,
    CNotificationKind kind = CNotificationKind.info,
    CNotificationContrast contrast = CNotificationContrast.low,
    VoidCallback? onCloseButtonTap,
    VoidCallback? onClose,
    int? timeout,
    List<NotificationAction>? actions,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        props = CNotificationToastProps(
          actions: actions,
          caption: caption,
          title: title,
          subtitle: subtitle,
          kind: kind,
          contrast: contrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        ),
        _type = CNotificationType.toast,
        super(key: key);

  CNotification.inline({
    Key? key,
    required Widget title,
    required Widget subtitle,
    Widget? caption,
    CNotificationKind kind = CNotificationKind.info,
    CNotificationContrast contrast = CNotificationContrast.low,
    VoidCallback? onCloseButtonTap,
    VoidCallback? onClose,
    int? timeout,
    List<NotificationAction>? actions,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        props = CNotificationInlineProps(
          actions: actions,
          title: title,
          subtitle: subtitle,
          kind: kind,
          contrast: contrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        ),
        _type = CNotificationType.inline,
        super(key: key);

  final CNotificationBaseProps props;

  /// Whether [CNotification] is `toast` or `inline`.
  final CNotificationType _type;

  @override
  Widget build(BuildContext context) {
    if (_type == CNotificationType.inline) {
      return _CNotificationInline(props: props as CNotificationInlineProps);
    } else {
      return _CNotificationToast(props: props as CNotificationToastProps);
    }
  }
}

abstract class _NotificationWidget extends StatelessWidget {
  const _NotificationWidget({super.key});

  bool get isHighContrast;

  CNotificationKind get kind;

  Color _getBackgroundColor(BuildContext context) {
    final theme = CarbonTheme.of(context);

    if (isHighContrast) {
      return theme.notificationTheme.highContrastColor;
    }

    return switch (kind) {
      CNotificationKind.error => theme.notificationTheme.errorBackgroundColor ?? CarbonTheme.layerColor(context),
      CNotificationKind.info => theme.notificationTheme.infoBackgroundColor ?? CarbonTheme.layerColor(context),
      CNotificationKind.success => theme.notificationTheme.successBackgroundColor ?? CarbonTheme.layerColor(context),
      CNotificationKind.warning => theme.notificationTheme.warningBackgroundColor ?? CarbonTheme.layerColor(context),
    };
  }
}

class _CNotificationInline extends _NotificationWidget {
  const _CNotificationInline({Key? key, required this.props}) : super(key: key);

  final CNotificationInlineProps props;

  @override
  bool get isHighContrast => props.contrast == CNotificationContrast.high;

  @override
  CNotificationKind get kind => props.kind;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  List<Widget> _buildActions() {
    final result = <Widget>[];

    for (var action in props.actions!) {
      result.addAll(
        [
          CButton(
            kind: CButtonKind.ghost,
            label: action.label,
            onPressed: action.onTap,
          ),
          const SizedBox(width: 8),
        ],
      );
    }

    result.removeLast();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final CNotificationKind kind = props.kind;
    final CNotificationContrast contrast = props.contrast;

    if (props.timeout != null) _startTimer();

    return CarbonThemeLayer(
      builder: (context, layerIndex, layerColor) {
        final carbonTheme = CarbonTheme.of(context);
        final backgroundColor = _getBackgroundColor(context);
        final contentColor = isHighContrast ? carbonTheme.notificationTheme.highContrastContentColor : Theme.of(context).textTheme.bodyMedium?.color;

        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: _Styles.inlineNotificationBorder[contrast]![kind]!,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: Icon(_Assets.kindIcon[kind]!,
                  color: _Assets.kindIconColor[kind],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: _Styles.contentPadding,
                  child: Wrap(
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: contentColor,
                          fontFamily: CFonts.primarySemibold,
                          package: assetsPackage,
                        ),
                        child: props.title,
                      ),
                      const SizedBox(width: 4),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: contentColor,
                          fontFamily: CFonts.primaryRegular,
                          package: assetsPackage,
                        ),
                        child: props.subtitle,
                      ),
                    ],
                  ),
                ),
              ),
              if (props.actions != null) ...[
                const SizedBox(width: 14),
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: _buildActions(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
              ],
              if (props.onCloseButtonTap != null)
                CButton.icon(
                  kind: CButtonKind.ghost,
                  icon: Builder(
                    builder: (ctx) => Icon(
                      _Assets.closeIcon[contrast]!,
                      size: 20,
                      color: contentColor,
                    ),
                  ),
                  onPressed: props.onCloseButtonTap!,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _CNotificationToast extends _NotificationWidget {
  const _CNotificationToast({Key? key, required this.props}) : super(key: key);

  final CNotificationToastProps props;

  @override
  bool get isHighContrast => props.contrast == CNotificationContrast.high;

  @override
  CNotificationKind get kind => props.kind;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CNotificationKind kind = props.kind;
    final CNotificationContrast contrast = props.contrast;

    if (props.timeout != null) _startTimer();

    return CarbonThemeLayer(
      builder: (context, layerIndex, layerColor) {
        final carbonTheme = CarbonTheme.of(context);
        final backgroundColor = _getBackgroundColor(context);
        final contentColor = isHighContrast ? carbonTheme.notificationTheme.highContrastContentColor : Theme.of(context).textTheme.bodyMedium?.color;

        return Container(
          width: 288,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: _Styles.toastNotificationBorder[kind]!,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: Icon(_Assets.kindIcon[kind]!,
                  color: _Assets.kindIconColor[kind],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: _Styles.contentPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: contentColor,
                            fontFamily: CFonts.primarySemibold,
                            package: assetsPackage,
                          ),
                          child: props.title,
                        ),
                      ),
                      Flexible(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: contentColor,
                            fontFamily: CFonts.primaryRegular,
                            package: assetsPackage,
                          ),
                          child: props.subtitle,
                        ),
                      ),
                      if (props.caption != null) ...[
                        const SizedBox(height: 24),
                        DefaultTextStyle(
                          style: TextStyle(
                            color: contentColor,
                            fontFamily: CFonts.primaryRegular,
                            package: assetsPackage,
                          ),
                          child: props.caption!,
                        ),
                      ]
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              if (props.onCloseButtonTap != null)
                CButton.icon(
                  kind: CButtonKind.ghost,
                  icon: Builder(
                    builder: (ctx) => Icon(
                      _Assets.closeIcon[contrast]!,
                      size: 20,
                      color: contentColor,
                    ),
                  ),
                  onPressed: props.onCloseButtonTap!,
                ),
            ],
          ),
        );
      },
    );
  }
}
