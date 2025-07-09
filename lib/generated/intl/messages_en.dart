// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(statusCode) =>
      "An Error occures with StatusCode : ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "ads": MessageLookupByLibrary.simpleMessage("Ads"),
        "ar": MessageLookupByLibrary.simpleMessage("Arabic"),
        "book_hotels_now":
            MessageLookupByLibrary.simpleMessage("Book Hotels easier now!!"),
        "change_language":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "check_in_date": MessageLookupByLibrary.simpleMessage("Check-in Date"),
        "check_out_date":
            MessageLookupByLibrary.simpleMessage("Check-out Date"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "de": MessageLookupByLibrary.simpleMessage("German"),
        "defaultErrorMsg": m0,
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "enter_search_term":
            MessageLookupByLibrary.simpleMessage("Enter a search term"),
        "et": MessageLookupByLibrary.simpleMessage("Estonian"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "fill_missing_fields": MessageLookupByLibrary.simpleMessage(
            "Please fill in all missing fields"),
        "hotels": MessageLookupByLibrary.simpleMessage("Hotels"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "latest_searches":
            MessageLookupByLibrary.simpleMessage("Latest Searches"),
        "no_internet_connection_msg":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "number_of_adults":
            MessageLookupByLibrary.simpleMessage("Number of Adults"),
        "overview": MessageLookupByLibrary.simpleMessage("Overview"),
        "pt": MessageLookupByLibrary.simpleMessage("Portuguese"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "search_for_hotels":
            MessageLookupByLibrary.simpleMessage("Search for Hotels"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "show_ads": MessageLookupByLibrary.simpleMessage("Show Ads"),
        "unable_to_get_response_msg":
            MessageLookupByLibrary.simpleMessage("Unable to get response"),
        "where": MessageLookupByLibrary.simpleMessage("Where?")
      };
}
