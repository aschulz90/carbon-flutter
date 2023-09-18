import 'package:carbon_flutter/features/link/link.props.dart';

class CBreadcrumbItemProps {
  /// The content of the item.
  ///
  /// @required
  final String label;

  final String url;

  /// Called when the item is tapped.
  ///
  /// @required
  final OnLinkClickedCallback onTap;

  /// Whether this breadcrumb item represents the current page or not.
  ///
  /// @default: `false`
  final bool isCurrentPage;

  CBreadcrumbItemProps({
    required this.label,
    required this.isCurrentPage,
    required this.onTap,
    this.url = "",
  });
}
