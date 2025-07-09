import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/hotels/presentation/hotels_bloc/hotels_bloc.dart';
import '../../injection_container.dart';

@RoutePage()
class AccountWrapperPage extends StatelessWidget {
  const AccountWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

@RoutePage()
class HotelsWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const HotelsWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }

  @override
  Widget wrappedRoute(context) {
    return BlocProvider.value(value: servLocator<HotelsBloc>(), child: this);
  }
}
