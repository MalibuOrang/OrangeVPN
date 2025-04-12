// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(pingValue) => "${pingValue} мс";

  static String m1(vpnCount) => "Сервери VPN: ${vpnCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "baseBite": MessageLookupByLibrary.simpleMessage("0 Біт/с"),
        "basePingMsg": MessageLookupByLibrary.simpleMessage("100 мс"),
        "baseSpeedDownloadUpload":
            MessageLookupByLibrary.simpleMessage("0 кбіт/с"),
        "bps": MessageLookupByLibrary.simpleMessage("Біт/с"),
        "connecting": MessageLookupByLibrary.simpleMessage("Підключення..."),
        "connectingVpnLocation": MessageLookupByLibrary.simpleMessage(
            "Підключення до місцезнаходження VPN..."),
        "country": MessageLookupByLibrary.simpleMessage("Авто"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Відключено"),
        "downloadText": MessageLookupByLibrary.simpleMessage("СКАЧУВАННЯ"),
        "fetching": MessageLookupByLibrary.simpleMessage("Отримання..."),
        "free": MessageLookupByLibrary.simpleMessage("БЕЗКОШТОВНО"),
        "gbps": MessageLookupByLibrary.simpleMessage("Гбіт/с"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Почати"),
        "internetProvider":
            MessageLookupByLibrary.simpleMessage("Інтернет-провайдер"),
        "ipAddress": MessageLookupByLibrary.simpleMessage("IP-адреса"),
        "kbps": MessageLookupByLibrary.simpleMessage("Кбіт/с"),
        "location": MessageLookupByLibrary.simpleMessage("Розташування"),
        "mbps": MessageLookupByLibrary.simpleMessage("Мбіт/с"),
        "networkTestScreen":
            MessageLookupByLibrary.simpleMessage("Інформація про IP"),
        "notSecured": MessageLookupByLibrary.simpleMessage("Не захищено 🛡️"),
        "orangeVpnSplashMessage": MessageLookupByLibrary.simpleMessage(
            "Orange VPN — це найшвидший VPN у світі, який надає вам понад 94 сервери в країнах по всьому світу."),
        "pincode": MessageLookupByLibrary.simpleMessage("Пін-код"),
        "ping": MessageLookupByLibrary.simpleMessage("ПІНГ"),
        "pingValueMs": m0,
        "secured": MessageLookupByLibrary.simpleMessage("Захищено 🛡️"),
        "selectLocationTabChangeLocation": MessageLookupByLibrary.simpleMessage(
            "Виберіть розташування, вкладку на піктограмі прапора"),
        "tbps": MessageLookupByLibrary.simpleMessage("Тбіт/с"),
        "timezone": MessageLookupByLibrary.simpleMessage("Часовий пояс"),
        "uploadText": MessageLookupByLibrary.simpleMessage("ЗАВАНТАЖИТИ"),
        "vpnCount": m1,
        "welcomeToOrangevpn":
            MessageLookupByLibrary.simpleMessage("Ласкаво просимо")
      };
}
