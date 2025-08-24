import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
class CallPage extends StatelessWidget {
  final String callID;
  final String userID = Random().nextInt(1000000).toString();

   CallPage({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 1808747197,
        appSign: 'b63dfd8d832cba36fd391ce282438ce678e9366cf9eb45b1420f10084206cfe5',
        callID: callID,
        userID: userID,
        userName: "User $userID",
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
