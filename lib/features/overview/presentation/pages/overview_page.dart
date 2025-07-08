import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  static const String routeName = '/overview';

  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Overview Page'));
  }
}
