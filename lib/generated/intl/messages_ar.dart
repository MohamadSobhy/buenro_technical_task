// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(statusCode) => "حدث خطأ مع رمز الحالة: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("الحساب"),
        "ar": MessageLookupByLibrary.simpleMessage("العربية"),
        "change_language": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
        "de": MessageLookupByLibrary.simpleMessage("German"),
        "defaultErrorMsg": m0,
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "et": MessageLookupByLibrary.simpleMessage("Estonian"),
        "favorites": MessageLookupByLibrary.simpleMessage("المفضلة"),
        "hotels": MessageLookupByLibrary.simpleMessage("الفنادق"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "no_internet_connection_msg":
            MessageLookupByLibrary.simpleMessage("لا يوجد اتصال بالإنترنت"),
        "overview": MessageLookupByLibrary.simpleMessage("نظرة عامة"),
        "pt": MessageLookupByLibrary.simpleMessage("Portuguese"),
        "select_language": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
        "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "unable_to_get_response_msg": MessageLookupByLibrary.simpleMessage(
            "غير قادر على الحصول على استجابة")
      };
}
