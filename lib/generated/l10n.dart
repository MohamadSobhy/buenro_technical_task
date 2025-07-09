// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No internet connection`
  String get no_internet_connection_msg {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection_msg',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get hotels {
    return Intl.message(
      'Hotels',
      name: 'hotels',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Unable to get response`
  String get unable_to_get_response_msg {
    return Intl.message(
      'Unable to get response',
      name: 'unable_to_get_response_msg',
      desc: '',
      args: [],
    );
  }

  /// `An Error occures with StatusCode : {statusCode}`
  String defaultErrorMsg(int statusCode) {
    return Intl.message(
      'An Error occures with StatusCode : $statusCode',
      name: 'defaultErrorMsg',
      desc:
          'Default error message when an error occurs with a specific status code.',
      args: [statusCode],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Estonian`
  String get et {
    return Intl.message(
      'Estonian',
      name: 'et',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get pt {
    return Intl.message(
      'Portuguese',
      name: 'pt',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get de {
    return Intl.message(
      'German',
      name: 'de',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Search for Hotels`
  String get search_for_hotels {
    return Intl.message(
      'Search for Hotels',
      name: 'search_for_hotels',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Enter a search term`
  String get enter_search_term {
    return Intl.message(
      'Enter a search term',
      name: 'enter_search_term',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Check-in Date`
  String get check_in_date {
    return Intl.message(
      'Check-in Date',
      name: 'check_in_date',
      desc: '',
      args: [],
    );
  }

  /// `Check-out Date`
  String get check_out_date {
    return Intl.message(
      'Check-out Date',
      name: 'check_out_date',
      desc: '',
      args: [],
    );
  }

  /// `Where?`
  String get where {
    return Intl.message(
      'Where?',
      name: 'where',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all missing fields`
  String get fill_missing_fields {
    return Intl.message(
      'Please fill in all missing fields',
      name: 'fill_missing_fields',
      desc: '',
      args: [],
    );
  }

  /// `Number of Adults`
  String get number_of_adults {
    return Intl.message(
      'Number of Adults',
      name: 'number_of_adults',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Ads`
  String get ads {
    return Intl.message(
      'Ads',
      name: 'ads',
      desc: '',
      args: [],
    );
  }

  /// `Show Ads`
  String get show_ads {
    return Intl.message(
      'Show Ads',
      name: 'show_ads',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
