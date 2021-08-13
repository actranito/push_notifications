import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmTokenView extends StatelessWidget {
  static final String route = '/fcmTokenViewRoute';
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text(
                        'My FCM Token',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Text('${tokenSnapshot.data}'),
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
