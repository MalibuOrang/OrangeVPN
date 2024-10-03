import 'dart:convert';

class Vpn {
  late final String hostname;
  late final String ip;
  late final String ping;
  late final int speed;
  late final String countryLong;
  late final String countryShort;
  late final int numVpnSessions;
  late final String message;
  late final String openVpnConfigDataBase64;

  Vpn({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countryLong,
    required this.countryShort,
    required this.numVpnSessions,
    required this.message,
    required this.openVpnConfigDataBase64,
  });

  factory Vpn.fromRawJson(String str) => Vpn.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vpn.fromJson(Map<String, dynamic> json) => Vpn(
        hostname: json["HostName"] ?? '',
        ip: json["IP"] ?? '',
        ping: json["Ping"].toString(),
        speed: json["Speed"] ?? 0,
        countryLong: json["CountryLong"] ?? '',
        countryShort: json["CountryShort"] ?? '',
        numVpnSessions: json["NumVpnSessions"] ?? 0,
        message: json["Message"] ?? '',
        openVpnConfigDataBase64: json["OpenVPN_ConfigData_Base64"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "HostName": hostname,
        "IP": ip,
        "Ping": ping,
        "Speed": speed,
        "CountryLong": countryLong,
        "CountryShort": countryShort,
        "NumVpnSessions": numVpnSessions,
        "Message": message,
        "OpenVPN_ConfigData_Base64": openVpnConfigDataBase64,
      };
}
