import 'package:flutter/material.dart';

class ScrollNotificationHandler extends StatelessWidget {
  final Widget child;
  final bool canLoadMore;
  final Function()? onLoadMore;

  const ScrollNotificationHandler({
    super.key,
    required this.child,
    this.canLoadMore = false,
    this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.axisDirection == AxisDirection.down &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 100 &&
            canLoadMore) {
          onLoadMore?.call();
        }

        return true;
      },
      child: child,
    );
  }
}
