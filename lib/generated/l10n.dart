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

  /// `Welcome to OrangeVPN`
  String get welcomeToOrangevpn {
    return Intl.message(
      'Welcome to OrangeVPN',
      name: 'welcomeToOrangevpn',
      desc: '',
      args: [],
    );
  }

  /// `Orange VPN is the fastest VPN in the world that provides you with more than 94 servers in countries all over the world.`
  String get orangeVpnSplashMessage {
    return Intl.message(
      'Orange VPN is the fastest VPN in the world that provides you with more than 94 servers in countries all over the world.',
      name: 'orangeVpnSplashMessage',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `IP information`
  String get networkTestScreen {
    return Intl.message(
      'IP information',
      name: 'networkTestScreen',
      desc: '',
      args: [],
    );
  }

  /// `IP Address`
  String get ipAddress {
    return Intl.message(
      'IP Address',
      name: 'ipAddress',
      desc: '',
      args: [],
    );
  }

  /// `Internet Provider`
  String get internetProvider {
    return Intl.message(
      'Internet Provider',
      name: 'internetProvider',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Fetching...`
  String get fetching {
    return Intl.message(
      'Fetching...',
      name: 'fetching',
      desc: '',
      args: [],
    );
  }

  /// `Pin-code`
  String get pincode {
    return Intl.message(
      'Pin-code',
      name: 'pincode',
      desc: '',
      args: [],
    );
  }

  /// `Timezone`
  String get timezone {
    return Intl.message(
      'Timezone',
      name: 'timezone',
      desc: '',
      args: [],
    );
  }

  /// `VPN Locations: {vpnCount}`
  String vpnCount(Object vpnCount) {
    return Intl.message(
      'VPN Locations: $vpnCount',
      name: 'vpnCount',
      desc: '',
      args: [vpnCount],
    );
  }

  /// `Connecting VPN Location...`
  String get connectingVpnLocation {
    return Intl.message(
      'Connecting VPN Location...',
      name: 'connectingVpnLocation',
      desc: '',
      args: [],
    );
  }

  /// `0 Bps`
  String get baseBite {
    return Intl.message(
      '0 Bps',
      name: 'baseBite',
      desc: '',
      args: [],
    );
  }

  /// `Bps`
  String get bps {
    return Intl.message(
      'Bps',
      name: 'bps',
      desc: '',
      args: [],
    );
  }

  /// `Kbps`
  String get kbps {
    return Intl.message(
      'Kbps',
      name: 'kbps',
      desc: '',
      args: [],
    );
  }

  /// `Mbps`
  String get mbps {
    return Intl.message(
      'Mbps',
      name: 'mbps',
      desc: '',
      args: [],
    );
  }

  /// `Gbps`
  String get gbps {
    return Intl.message(
      'Gbps',
      name: 'gbps',
      desc: '',
      args: [],
    );
  }

  /// `Tbps`
  String get tbps {
    return Intl.message(
      'Tbps',
      name: 'tbps',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get country {
    return Intl.message(
      'Auto',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `FREE`
  String get free {
    return Intl.message(
      'FREE',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `100 ms`
  String get basePingMsg {
    return Intl.message(
      '100 ms',
      name: 'basePingMsg',
      desc: '',
      args: [],
    );
  }

  /// `PING`
  String get ping {
    return Intl.message(
      'PING',
      name: 'ping',
      desc: '',
      args: [],
    );
  }

  /// `UPLOAD`
  String get uploadText {
    return Intl.message(
      'UPLOAD',
      name: 'uploadText',
      desc: '',
      args: [],
    );
  }

  /// `0 kbps`
  String get baseSpeedDownloadUpload {
    return Intl.message(
      '0 kbps',
      name: 'baseSpeedDownloadUpload',
      desc: '',
      args: [],
    );
  }

  /// `DOWNLOAD`
  String get downloadText {
    return Intl.message(
      'DOWNLOAD',
      name: 'downloadText',
      desc: '',
      args: [],
    );
  }

  /// `{pingValue} ms`
  String pingValueMs(Object pingValue) {
    return Intl.message(
      '$pingValue ms',
      name: 'pingValueMs',
      desc: '',
      args: [pingValue],
    );
  }

  /// `Not Secured 🛡️`
  String get notSecured {
    return Intl.message(
      'Not Secured 🛡️',
      name: 'notSecured',
      desc: '',
      args: [],
    );
  }

  /// `Disconnected`
  String get disconnected {
    return Intl.message(
      'Disconnected',
      name: 'disconnected',
      desc: '',
      args: [],
    );
  }

  /// `Secured 🛡️`
  String get secured {
    return Intl.message(
      'Secured 🛡️',
      name: 'secured',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get connecting {
    return Intl.message(
      'Connecting...',
      name: 'connecting',
      desc: '',
      args: [],
    );
  }

  /// `Select a Location, tab on the flag icon`
  String get selectLocationTabChangeLocation {
    return Intl.message(
      'Select a Location, tab on the flag icon',
      name: 'selectLocationTabChangeLocation',
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
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
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
