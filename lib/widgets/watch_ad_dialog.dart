import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchAdDialog extends StatelessWidget {
  final VoidCallback onCompleate;
  const WatchAdDialog({super.key, required this.onCompleate});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Change Theme'),
      content: Text('Watch an Ad to Change App Theme'),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Watch Ad',
            style: TextStyle(color: Colors.blue),
          ),
          isDefaultAction: true,
          onPressed: () {
            Get.back();
            onCompleate();
          },
        ),
      ],
    );
  }
}
