import 'dart:convert';
import 'dart:developer';

import 'package:buenro_technical_task/core/errors/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/constants/constant_keys.dart';
import '../models/search_data_model.dart';

abstract class HotelsLocalDataSource {
  Future<List<SearchDataModel>> fetchLatestSearchInfo();
  Future<SearchDataModel> saveSearchInfo(SearchDataModel searchInfo);
}

class AppHotelsLocalDataSource extends HotelsLocalDataSource {
  final HiveInterface hive;

  AppHotelsLocalDataSource({required this.hive});

  Future<Box> _initDatabase(String boxName) async {
    try {
      if (!kIsWeb && !hive.isBoxOpen(boxName)) {
        hive.init((await getApplicationDocumentsDirectory()).path);
        hive.initFlutter();
      }

      Logger().i("Hive db initialized!");

      return await hive.openBox(boxName);
    } catch (err) {
      log(err.toString());
      throw CacheException(
        message: 'Unable to intialize database for box: $boxName',
      );
    }
  }

  @override
  Future<List<SearchDataModel>> fetchLatestSearchInfo() async {
    final searchesBox = await _initDatabase(ConstantKeys.latestSearchesBoxKey);

    final searchDataString = searchesBox.get(
      ConstantKeys.latestSearchesDataKey,
    );

    if (searchDataString != null) {
      final seacrhDataJson =
          (json.decode(searchDataString) ?? []) as List<dynamic>;

      final searchesData = seacrhDataJson
          .map((e) => SearchDataModel.fromJson(e))
          .toList();

      return searchesData;
    }

    return [];
  }

  @override
  Future<SearchDataModel> saveSearchInfo(SearchDataModel searchInfo) async {
    final searchesBox = await _initDatabase(ConstantKeys.latestSearchesBoxKey);

    final prevSearchesData = await fetchLatestSearchInfo();
    prevSearchesData.add(searchInfo);

    await searchesBox.put(
      ConstantKeys.latestSearchesDataKey,
      json.encode(prevSearchesData.toSet().map((e) => e.toJson()).toList()),
    );

    return searchInfo;
  }
}
