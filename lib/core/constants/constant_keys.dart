import 'package:flutter/foundation.dart';

class ConstantKeys {
  /// Strings
  static const String latestSearchesBoxKey = 'latest_searches_box_key';
  static const String latestSearchesDataKey = 'latest_searches_key';
  static const String favouritePropertiesBoxKey =
      'favourite_properties_box_key';
  static const String favouritePropertiesDataKey = 'favourite_properties_key';

  /// Views Keys
  static const Key kQuerySearchFieldKey = Key('query_search_field_key');
  static const Key kCheckInDateKey = Key('query_check_in_date_key');
  static const Key kCheckOutDateKey = Key('query_check_out_date_key');
  static const Key kNumberOfAdultsFieldKey = Key(
    'query_number_of_adults_field_key',
  );
  static const Key kSearchBtnKey = Key('search_btn_key');
  static const Key kShowAdsSwitchKey = Key('show_ads_switch_key');
}
