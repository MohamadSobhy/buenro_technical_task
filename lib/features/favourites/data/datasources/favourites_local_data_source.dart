import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/constants/constant_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../hotels/data/models/property_model.dart';

abstract class FavouritesLocalDataSource {
  Future<List<PropertyModel>> fetchFavouriteProperties();
  Future<List<PropertyModel>> togglePropertyFavouriteStatus({
    required PropertyModel property,
    required bool isFavourite,
  });
}

class AppFavouritesLocalDataSource extends FavouritesLocalDataSource {
  final HiveInterface hive;

  AppFavouritesLocalDataSource({required this.hive});

  Future<Box?> _initDatabase(String boxName) async {
    try {
      if (!kIsWeb && !hive.isBoxOpen(boxName)) {
        hive.init((await getApplicationDocumentsDirectory()).path);
        hive.initFlutter();
      }

      Logger().i("Hive db initialized!");

      return await hive.openBox(boxName);
    } catch (_) {
      throw CacheException(
        message: 'Unable to intialize database for box: $boxName',
      );
    }
  }

  @override
  Future<List<PropertyModel>> fetchFavouriteProperties() async {
    final favouritesBox = await _initDatabase(
      ConstantKeys.favouritePropertiesBoxKey,
    );

    if (favouritesBox != null) {
      final favouritesDataString = favouritesBox.get(
        ConstantKeys.favouritePropertiesDataKey,
      );

      if (favouritesDataString != null) {
        final favouritesDataJson =
            (json.decode(favouritesDataString) ?? []) as List<dynamic>;

        final searchesData = favouritesDataJson
            .toSet()
            .map((e) => PropertyModel.fromJson(e))
            .toList();

        return searchesData.toSet().toList();
      }
    }

    return [];
  }

  @override
  Future<List<PropertyModel>> togglePropertyFavouriteStatus({
    required PropertyModel property,
    required bool isFavourite,
  }) async {
    final favouritesBox = await _initDatabase(
      ConstantKeys.favouritePropertiesBoxKey,
    );

    if (favouritesBox != null) {
      final favouritesData = await fetchFavouriteProperties();

      if (isFavourite) {
        favouritesData.add(property);
      } else {
        favouritesData.removeWhere(
          (e) => e.propertyToken == property.propertyToken,
        );
      }

      await favouritesBox.put(
        ConstantKeys.favouritePropertiesDataKey,
        json.encode(favouritesData.toSet().map((e) => e.toJson()).toList()),
      );

      return favouritesData.toSet().toList();
    }

    throw const CacheException(message: "Error caching favourite data!");
  }
}
