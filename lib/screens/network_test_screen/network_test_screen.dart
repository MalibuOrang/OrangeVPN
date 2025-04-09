import 'package:expance_tracker/apis/apis.dart';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:expance_tracker/models/ip_details.dart';
import 'package:expance_tracker/models/network_data.dart';
import 'package:expance_tracker/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ipData = IpDetails.fromJson({}).obs;
    final screenSize = MediaQuery.of(context).size;
    APIs.getIPDetails(ipData: ipData);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).networkTestScreen),
      ),
      body: AppBackground(
        child: Stack(
          children: [
            Obx(
              () => RefreshIndicator(
                color: Colors.orange,
                onRefresh: () async {
                  ipData.value = IpDetails.fromJson({});
                  APIs.getIPDetails(ipData: ipData);
                },
                child: ListView(
                  padding: EdgeInsets.only(
                    left: screenSize.width * 0.04,
                    right: screenSize.width * 0.04,
                    top: screenSize.height * 0.015,
                    bottom: screenSize.height * 0.1,
                  ),
                  children: [
                    NetworkCardWidget(
                      screenSize: screenSize,
                      data: NetworkData(
                        title: S.of(context).ipAddress,
                        subtitle: ipData.value.query,
                        icon: Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    NetworkCardWidget(
                      screenSize: screenSize,
                      data: NetworkData(
                        title: S.of(context).internetProvider,
                        subtitle: ipData.value.isp,
                        icon: Icon(
                          Icons.business,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    NetworkCardWidget(
                      screenSize: screenSize,
                      data: NetworkData(
                        title: S.of(context).location,
                        subtitle: ipData.value.country.isEmpty
                            ? S.of(context).fetching
                            : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',
                        icon: Icon(
                          CupertinoIcons.location,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    NetworkCardWidget(
                      screenSize: screenSize,
                      data: NetworkData(
                        title: S.of(context).pincode,
                        subtitle: ipData.value.zip,
                        icon: Icon(
                          Icons.password,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                    NetworkCardWidget(
                      screenSize: screenSize,
                      data: NetworkData(
                        title: S.of(context).timezone,
                        subtitle: ipData.value.timezone,
                        icon: Icon(
                          CupertinoIcons.time,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
