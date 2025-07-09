// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(statusCode) =>
      "Ein Fehler ist aufgetreten mit StatusCode: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Konto"),
        "ads": MessageLookupByLibrary.simpleMessage("Werbung"),
        "ar": MessageLookupByLibrary.simpleMessage("Arabisch"),
        "book_hotels_now": MessageLookupByLibrary.simpleMessage(
            "Jetzt Hotels einfacher buchen!!"),
        "change_language":
            MessageLookupByLibrary.simpleMessage("Sprache ändern"),
        "check_in_date": MessageLookupByLibrary.simpleMessage("Check-in-Datum"),
        "check_out_date":
            MessageLookupByLibrary.simpleMessage("Check-out-Datum"),
        "close": MessageLookupByLibrary.simpleMessage("Schließen"),
        "de": MessageLookupByLibrary.simpleMessage("Deutsch"),
        "defaultErrorMsg": m0,
        "en": MessageLookupByLibrary.simpleMessage("Englisch"),
        "enter_search_term":
            MessageLookupByLibrary.simpleMessage("Suchbegriff eingeben"),
        "et": MessageLookupByLibrary.simpleMessage("Estnisch"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favoriten"),
        "fill_missing_fields": MessageLookupByLibrary.simpleMessage(
            "Bitte füllen Sie alle fehlenden Felder aus"),
        "hotels": MessageLookupByLibrary.simpleMessage("Hotels"),
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "latest_searches":
            MessageLookupByLibrary.simpleMessage("Letzte Suchen"),
        "no_favourites_msg": MessageLookupByLibrary.simpleMessage(
            "Sie haben keine Hotels zu Ihrer Favoritenliste hinzugefügt."),
        "no_internet_connection_msg":
            MessageLookupByLibrary.simpleMessage("Keine Internetverbindung"),
        "number_of_adults":
            MessageLookupByLibrary.simpleMessage("Anzahl der Erwachsenen"),
        "overview": MessageLookupByLibrary.simpleMessage("Übersicht"),
        "pt": MessageLookupByLibrary.simpleMessage("Portugiesisch"),
        "retry": MessageLookupByLibrary.simpleMessage("Wiederholen"),
        "search": MessageLookupByLibrary.simpleMessage("Suchen"),
        "search_for_hotels":
            MessageLookupByLibrary.simpleMessage("Hotels suchen"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Sprache auswählen"),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "show_ads": MessageLookupByLibrary.simpleMessage("Werbung anzeigen"),
        "unable_to_get_response_msg": MessageLookupByLibrary.simpleMessage(
            "Antwort konnte nicht empfangen werden"),
        "where": MessageLookupByLibrary.simpleMessage("Wo?")
      };
}
