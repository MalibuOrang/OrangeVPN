import 'package:country_flags/country_flags.dart';
import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/screens/location_screen/location_screen.dart';
import 'package:expance_tracker/screens/network_test_screen/network_test_screen.dart';
import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/vpn_status.dart';
import '../../services/vpn_engine.dart';
import '../../widgets/widget.dart';
import 'widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    VpnEngine.vpnStageSnapshot().listen((event) {
      _controller.vpnState.value = event;
    });
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: theme.appBarTheme.elevation,
          title: Text(
            'OrangeVPN',
            style: theme.appBarTheme.titleTextStyle
                ?.copyWith(color: theme.titleAppBarColor),
          ),
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              LeadingActionButton(
                icon: CupertinoIcons.circle_lefthalf_fill,
                onPressed: () {
                  Get.changeThemeMode(
                    Pref.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                  );
                  Pref.isDarkMode = !Pref.isDarkMode;
                },
              ),
            ],
          ),
          actions: [
            LeadingActionButton(
              icon: CupertinoIcons.info,
              onPressed: () {
                Get.to(() => NetworkTestScreen());
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: AppBackground(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => vpnButton(_controller, screenSize, context),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeCardWidget(
                          screenSize: screenSize,
                          title:
                              _controller.selectedVpn.value.countryLong.isEmpty
                                  ? S.of(context).country
                                  : _controller.selectedVpn.value.countryLong,
                          subtitle: S.of(context).free,
                          icon: InkWell(
                            onTap: () {
                              _controller.isAuto.value = false;
                              Get.to(() => LocationScreen());
                            },
                            child: CustomCircleAvatar(
                              color: Colors.blue,
                              child: _controller
                                      .selectedVpn.value.countryLong.isEmpty
                                  ? CustomIcon(
                                      color: theme.infoButtonIconColor,
                                      icon: Icons.auto_fix_high,
                                    )
                                  : _controller.selectedVpn.value.countryLong
                                          .isNotEmpty
                                      ? CountryFlag.fromCountryCode(
                                          _controller
                                              .selectedVpn.value.countryShort,
                                          shape: Circle(),
                                          width: 60,
                                          height: 60,
                                        )
                                      : CustomIcon(
                                          color: theme.infoButtonIconColor,
                                          icon: Icons.auto_fix_high,
                                        ),
                            ),
                          ),
                        ),
                        HomeCardWidget(
                          screenSize: screenSize,
                          title:
                              _controller.selectedVpn.value.countryLong.isEmpty
                                  ? S.of(context).basePingMsg
                                  : S.of(context).pingValueMs(
                                      _controller.selectedVpn.value.ping),
                          subtitle: S.of(context).ping,
                          icon: CustomCircleAvatar(
                            color: Colors.orange,
                            child: CustomIcon(
                              color: theme.infoButtonIconColor,
                              icon: Icons.equalizer,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  StreamBuilder<VpnStatus?>(
                    initialData: VpnStatus(),
                    stream: VpnEngine.vpnStatusSnapshot(),
                    builder: (context, snapshot) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeCardWidget(
                          screenSize: screenSize,
                          title:
                              '${snapshot.data?.byteIn ?? S.of(context).baseSpeedDownloadUpload} ',
                          subtitle: S.of(context).downloadText,
                          icon: CustomCircleAvatar(
                            color: Colors.lightGreen,
                            child: CustomIcon(
                              color: theme.infoButtonIconColor,
                              icon: Icons.arrow_downward_outlined,
                            ),
                          ),
                        ),
                        HomeCardWidget(
                          screenSize: screenSize,
                          title:
                              '${snapshot.data?.byteOut ?? S.of(context).baseSpeedDownloadUpload}',
                          subtitle: S.of(context).uploadText,
                          icon: CustomCircleAvatar(
                            color: Colors.blue,
                            child: CustomIcon(
                              color: theme.infoButtonIconColor,
                              icon: Icons.arrow_upward_outlined,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
