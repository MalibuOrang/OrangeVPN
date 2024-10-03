import 'dart:convert';

class IpDetails {
  final String country;
  final String regionName;
  final String city;
  final String zip;
  final String timezone;
  final String isp;
  final String query;

  IpDetails({
    required this.country,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.timezone,
    required this.isp,
    required this.query,
  });
  factory IpDetails.fromRawJson(String str) =>
      IpDetails.fromJson(json.decode(str));

  factory IpDetails.fromJson(Map<String, dynamic> json) => IpDetails(
        country: json["country"] ?? '',
        regionName: json["regionName"] ?? '',
        city: json["city"] ?? '',
        zip: json["zip"] ?? '- - - -',
        timezone: json["timezone"] ?? 'Unknown',
        isp: json["isp"] ?? 'Unknown',
        query: json["query"] ?? 'Not available',
      );
}
