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

  static String m0(pingValue) => "${pingValue} ms";

  static String m1(vpnCount) => "VPN Locations: ${vpnCount}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "baseBite": MessageLookupByLibrary.simpleMessage("0 Bps"),
        "basePingMsg": MessageLookupByLibrary.simpleMessage("100 ms"),
        "baseSpeedDownloadUpload":
            MessageLookupByLibrary.simpleMessage("0 kbps"),
        "bps": MessageLookupByLibrary.simpleMessage("Bps"),
        "connecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
        "connectingVpnLocation":
            MessageLookupByLibrary.simpleMessage("Connecting VPN Location..."),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
        "downloadText": MessageLookupByLibrary.simpleMessage("DOWNLOAD"),
        "fetching": MessageLookupByLibrary.simpleMessage("Fetching..."),
        "free": MessageLookupByLibrary.simpleMessage("FREE"),
        "gbps": MessageLookupByLibrary.simpleMessage("Gbps"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "internetProvider":
            MessageLookupByLibrary.simpleMessage("Internet Provider"),
        "ipAddress": MessageLookupByLibrary.simpleMessage("IP Address"),
        "kbps": MessageLookupByLibrary.simpleMessage("Kbps"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "mbps": MessageLookupByLibrary.simpleMessage("Mbps"),
        "networkTestScreen":
            MessageLookupByLibrary.simpleMessage("IP information"),
        "notSecured": MessageLookupByLibrary.simpleMessage("Not Secured 🛡️"),
        "orangeVpnSplashMessage": MessageLookupByLibrary.simpleMessage(
            "Orange VPN is the fastest VPN in the world that provides you with more than 94 servers in countries all over the world."),
        "pincode": MessageLookupByLibrary.simpleMessage("Pin-code"),
        "ping": MessageLookupByLibrary.simpleMessage("PING"),
        "pingValueMs": m0,
        "secured": MessageLookupByLibrary.simpleMessage("Secured 🛡️"),
        "selectLocationTabChangeLocation": MessageLookupByLibrary.simpleMessage(
            "Select a Location, tab on the flag icon"),
        "tbps": MessageLookupByLibrary.simpleMessage("Tbps"),
        "timezone": MessageLookupByLibrary.simpleMessage("Timezone"),
        "uploadText": MessageLookupByLibrary.simpleMessage("UPLOAD"),
        "vpnCount": m1,
        "welcomeToOrangevpn":
            MessageLookupByLibrary.simpleMessage("Welcome to OrangeVPN")
      };
}
