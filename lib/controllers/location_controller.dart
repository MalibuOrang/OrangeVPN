import 'package:expance_tracker/apis/apis.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  List<Vpn> listVpn = Pref.vpnList;
  final RxBool isLoading = false.obs;
  Future<void> getVpnData() async {
    isLoading.value = true;
    listVpn.clear();
    listVpn = await APIs.getVpnServers();
    isLoading.value = false;
  }
}
