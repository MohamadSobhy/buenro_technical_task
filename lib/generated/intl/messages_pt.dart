// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(statusCode) =>
      "Ocorreu um erro com o StatusCode: ${statusCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Conta"),
        "ads": MessageLookupByLibrary.simpleMessage("Anúncios"),
        "ar": MessageLookupByLibrary.simpleMessage("Árabe"),
        "book_hotels_now": MessageLookupByLibrary.simpleMessage(
            "Reserve hotéis mais fácil agora!!"),
        "change_language": MessageLookupByLibrary.simpleMessage("Mudar idioma"),
        "check_in_date":
            MessageLookupByLibrary.simpleMessage("Data de check-in"),
        "check_out_date":
            MessageLookupByLibrary.simpleMessage("Data de check-out"),
        "close": MessageLookupByLibrary.simpleMessage("Fechar"),
        "de": MessageLookupByLibrary.simpleMessage("Alemão"),
        "defaultErrorMsg": m0,
        "en": MessageLookupByLibrary.simpleMessage("Inglês"),
        "enter_search_term":
            MessageLookupByLibrary.simpleMessage("Digite um termo de pesquisa"),
        "et": MessageLookupByLibrary.simpleMessage("Estoniano"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
        "fill_missing_fields": MessageLookupByLibrary.simpleMessage(
            "Por favor, preencha todos os campos obrigatórios"),
        "hotels": MessageLookupByLibrary.simpleMessage("Hotéis"),
        "language": MessageLookupByLibrary.simpleMessage("Idioma"),
        "latest_searches":
            MessageLookupByLibrary.simpleMessage("Últimas pesquisas"),
        "no_favourites_msg": MessageLookupByLibrary.simpleMessage(
            "Você não adicionou nenhum hotel à sua lista de favoritos."),
        "no_internet_connection_msg":
            MessageLookupByLibrary.simpleMessage("Sem conexão com a internet"),
        "number_of_adults":
            MessageLookupByLibrary.simpleMessage("Número de adultos"),
        "overview": MessageLookupByLibrary.simpleMessage("Visão geral"),
        "pt": MessageLookupByLibrary.simpleMessage("Português"),
        "retry": MessageLookupByLibrary.simpleMessage("Tentar novamente"),
        "search": MessageLookupByLibrary.simpleMessage("Pesquisar"),
        "search_for_hotels":
            MessageLookupByLibrary.simpleMessage("Pesquisar hotéis"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Selecionar idioma"),
        "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
        "show_ads": MessageLookupByLibrary.simpleMessage("Mostrar anúncios"),
        "unable_to_get_response_msg": MessageLookupByLibrary.simpleMessage(
            "Não foi possível obter resposta"),
        "where": MessageLookupByLibrary.simpleMessage("Onde?")
      };
}
