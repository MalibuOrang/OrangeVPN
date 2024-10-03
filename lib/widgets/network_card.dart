import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/network_data.dart';
import 'package:flutter/material.dart';

class NetworkCardWidget extends StatelessWidget {
  final NetworkData data;
  const NetworkCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01,
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(
            data.icon.icon,
            color: data.icon.color,
            size: data.icon.size ?? 28,
          ),
          title: Text(data.title),
          subtitle: Text(data.subtitle),
        ),
      ),
    );
  }
}
