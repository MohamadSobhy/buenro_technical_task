import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_module.dart';
import '../../../../core/enums/app_toast_mode.dart';
import '../../../../core/widgets/app_toast/app_toast.dart';
import '../../../../core/widgets/tap_effect.dart';
import '../../../favourites/presentation/favourites_bloc/favourites_bloc.dart';
import '../../domain/entities/property.dart';

class PropertyFavouriteButton extends StatefulWidget {
  final Property property;

  const PropertyFavouriteButton({super.key, required this.property});

  @override
  State<PropertyFavouriteButton> createState() =>
      _PropertyFavouriteButtonState();
}

class _PropertyFavouriteButtonState extends State<PropertyFavouriteButton> {
  bool _isFavourite = false;

  @override
  void initState() {
    final bloc = context.read<FavouritesBloc>();
    _isFavourite = bloc.isFavouriteProperty(widget.property.propertyToken);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: _togglePropertyFavouriteStatusCallback,
      child: Container(
        decoration: BoxDecoration(
          color: AppModule.I.appColors.white,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<FavouritesBloc, FavouritesState>(
          buildWhen: (_, state) =>
              state.propertyToken == widget.property.propertyToken &&
              (state is ToggleFavouriteLoadingState ||
                  state is ToggleFavouriteErrorState ||
                  state is FavouriteStatusToggledState),
          listener: _onListeningToFavouritesBlocStates,
          builder: (context, state) {
            if (state is FavouritesLoadingState) {
              return SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            } else if (state is FavouriteStatusToggledState) {
              if (state.propertyToken == widget.property.propertyToken) {
                _isFavourite = state.isFavourite;
              }
            }

            return Icon(
              _isFavourite ? Icons.favorite : Icons.favorite_border,
              color: AppModule.I.appColors.primaryColor,
            );
          },
        ),
      ),
    );
  }

  void _onListeningToFavouritesBlocStates(_, FavouritesState state) {
    if (state.propertyToken != widget.property.propertyToken) return;

    if (state is ToggleFavouriteErrorState) {
      AppToast.I.showToast(state.message, mode: AppToastMode.error);
    }
  }

  void _togglePropertyFavouriteStatusCallback() {
    final bloc = context.read<FavouritesBloc>();
    bloc.add(
      TogglePropertyFavouriteStatusEvent(
        property: widget.property,
        isFavourite: !_isFavourite,
      ),
    );
  }
}
