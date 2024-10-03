import 'package:expance_tracker/apis/apis.dart';
import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/ip_details.dart';
import 'package:expance_tracker/models/network_data.dart';
import 'package:expance_tracker/widgets/network_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ipData = IpDetails.fromJson({}).obs;
    APIs.getIPDetails(ipData: ipData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Test Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          ipData.value = IpDetails.fromJson({});
          APIs.getIPDetails(ipData: ipData);
        },
        child: Icon(
          CupertinoIcons.refresh,
          color: Colors.white,
        ),
      ),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.04,
            right: screenSize.width * 0.04,
            top: screenSize.height * 0.015,
            bottom: screenSize.height * 0.1,
          ),
          children: [
            NetworkCardWidget(
              data: NetworkData(
                title: 'IP Address',
                subtitle: ipData.value.query,
                icon: Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.blue,
                ),
              ),
            ),
            NetworkCardWidget(
              data: NetworkData(
                title: 'Internet Provider',
                subtitle: ipData.value.isp,
                icon: Icon(
                  Icons.business,
                  color: Colors.orange,
                ),
              ),
            ),
            NetworkCardWidget(
              data: NetworkData(
                title: 'Location',
                subtitle: ipData.value.country.isEmpty
                    ? 'Fetching ...'
                    : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',
                icon: Icon(
                  CupertinoIcons.location,
                  color: Colors.pink,
                ),
              ),
            ),
            NetworkCardWidget(
              data: NetworkData(
                title: 'Pin-code',
                subtitle: ipData.value.zip,
                icon: Icon(
                  Icons.password,
                  color: Colors.cyan,
                ),
              ),
            ),
            NetworkCardWidget(
              data: NetworkData(
                title: 'Timezone',
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
    );
  }
}
