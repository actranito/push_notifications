import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmTokenView extends StatelessWidget {
  const FcmTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _fcm = FirebaseMessaging.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          future: _fcm.getToken(),
          builder: (context, tokenSnapshot) {
            if (!tokenSnapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              print(tokenSnapshot.data);
              return Text('FCM Token: ${tokenSnapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
