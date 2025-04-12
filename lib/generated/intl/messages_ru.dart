// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(pingValue) => "${pingValue} мс";

  static String m1(vpnCount) => "Сервера VPN: ${vpnCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "baseBite": MessageLookupByLibrary.simpleMessage("0 Бит/с"),
        "basePingMsg": MessageLookupByLibrary.simpleMessage("100 мс"),
        "baseSpeedDownloadUpload":
            MessageLookupByLibrary.simpleMessage("0 кбит/с"),
        "bps": MessageLookupByLibrary.simpleMessage("Бит/с"),
        "connecting": MessageLookupByLibrary.simpleMessage("Подключение..."),
        "connectingVpnLocation": MessageLookupByLibrary.simpleMessage(
            "Подключение местоположения VPN..."),
        "country": MessageLookupByLibrary.simpleMessage("Авто"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Отключено"),
        "downloadText": MessageLookupByLibrary.simpleMessage("СКАЧИВАНИЕ"),
        "fetching": MessageLookupByLibrary.simpleMessage("Извлечение..."),
        "free": MessageLookupByLibrary.simpleMessage("БЕСПЛАТНО"),
        "gbps": MessageLookupByLibrary.simpleMessage("Гбит/с"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Начать"),
        "internetProvider":
            MessageLookupByLibrary.simpleMessage("Интернет-провайдер"),
        "ipAddress": MessageLookupByLibrary.simpleMessage("IP-адрес"),
        "kbps": MessageLookupByLibrary.simpleMessage("Кбит/с"),
        "location": MessageLookupByLibrary.simpleMessage("Местоположение"),
        "mbps": MessageLookupByLibrary.simpleMessage("Мбит/с"),
        "networkTestScreen":
            MessageLookupByLibrary.simpleMessage("Інформация про IP"),
        "notSecured": MessageLookupByLibrary.simpleMessage("Не защищено 🛡️"),
        "orangeVpnSplashMessage": MessageLookupByLibrary.simpleMessage(
            "Orange VPN — самый быстрый VPN в мире, предоставляющий вам доступ к более чем 94 серверам в странах по всему миру."),
        "pincode": MessageLookupByLibrary.simpleMessage("PIN-код"),
        "ping": MessageLookupByLibrary.simpleMessage("ПИНГ"),
        "pingValueMs": m0,
        "secured": MessageLookupByLibrary.simpleMessage("Защищено 🛡️"),
        "selectLocationTabChangeLocation": MessageLookupByLibrary.simpleMessage(
            "Выберите местоположение, нажава на иконку флага"),
        "tbps": MessageLookupByLibrary.simpleMessage("Тбит/с"),
        "timezone": MessageLookupByLibrary.simpleMessage("Часовой пояс"),
        "uploadText": MessageLookupByLibrary.simpleMessage("ЗАГРУЗКА"),
        "vpnCount": m1,
        "welcomeToOrangevpn":
            MessageLookupByLibrary.simpleMessage("Добро пожаловать")
      };
}
