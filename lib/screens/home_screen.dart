import 'package:country_flags/country_flags.dart';
import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/screens/location_screen.dart';
import 'package:expance_tracker/screens/network_test_screen.dart';
import 'package:expance_tracker/widgets/count_down_timer.dart';
import 'package:expance_tracker/widgets/home_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/vpn_status.dart';
import '../services/vpn_engine.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    VpnEngine.vpnStageSnapshot().listen((event) {
      _controller.vpnState.value = event;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OrangeVPN',
          style: TextStyle(fontSize: 16),
        ),
        leading: Icon(
          CupertinoIcons.home,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                Pref.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
              Pref.isDarkMode = !Pref.isDarkMode;
            },
            icon: Icon(
              Icons.brightness_medium,
              size: 26,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 8),
            onPressed: () {
              Get.to(() => NetworkTestScreen());
            },
            icon: Icon(
              CupertinoIcons.info,
              size: 26,
            ),
          )
        ],
      ),
      bottomNavigationBar: _changeLocation(
        CupertinoIcons.globe,
        Icons.keyboard_arrow_right_outlined,
        context,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => _vpnButton()),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeCardWidget(
                  title: _controller.selectedVpn.value.countryLong.isEmpty
                      ? 'Country'
                      : _controller.selectedVpn.value.countryLong,
                  subtitle: 'FREE',
                  icon: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30,
                    child: _controller.selectedVpn.value.countryLong.isEmpty
                        ? Icon(
                            Icons.vpn_lock_rounded,
                            color: Colors.white,
                            size: 30,
                          )
                        : CountryFlag.fromCountryCode(
                            _controller.selectedVpn.value.countryShort,
                            shape: Circle(),
                            width: 60,
                            height: 60,
                          ),
                  ),
                ),
                HomeCardWidget(
                  title: _controller.selectedVpn.value.countryLong.isEmpty
                      ? '100 ms'
                      : '${_controller.selectedVpn.value.ping} ms',
                  subtitle: 'PING',
                  icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.equalizer,
                      size: 30,
                      color: Colors.white,
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
                  title: '${snapshot.data?.byteIn ?? "0 kbps"} ',
                  subtitle: 'DOWNLOAD',
                  icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.lightGreen,
                    child: Icon(
                      Icons.arrow_downward_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                HomeCardWidget(
                  title: '${snapshot.data?.byteOut ?? "0 kbps"} ',
                  subtitle: 'UPLOAD',
                  icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.arrow_upward_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _vpnButton() {
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: () {
              _controller.connectToVpn();
            },
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // ignore: deprecated_member_use
                color: _controller.getButtonColor.withOpacity(0.1),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // ignore: deprecated_member_use
                  color: _controller.getButtonColor.withOpacity(0.3),
                ),
                child: Container(
                  width: screenSize.height * 0.14,
                  height: screenSize.height * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller.getButtonColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _controller.getButtonText,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: screenSize.height * 0.015, bottom: screenSize.height * 0.02),
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            _controller.vpnState.value == VpnEngine.vpnDisconnected
                ? 'Not Connected'
                : _controller.vpnState.replaceAll('_', ' ').toLowerCase(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Obx(
          () => CountDownTimerWidget(
            startTimer: _controller.vpnState.value == VpnEngine.vpnConnected,
          ),
        ),
      ],
    );
  }

  Widget _changeLocation(
      IconData iconLeft, IconData iconRight, BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {
            Get.to(() => LocationScreen());
          },
          child: Container(
            color: Theme.of(context).bottomNav,
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            height: 60,
            child: Row(
              children: [
                Icon(
                  iconLeft,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    iconRight,
                    color: Colors.blue,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
