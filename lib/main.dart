import 'package:flutter/material.dart';
import 'package:push_notifications/views/fcm_token_view.dart';
import 'package:push_notifications/views/initial_view.dart';
import 'package:push_notifications/views/porto_view.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => InitialView(),
        '/fcmKeyRoute': (context) => FcmTokenView(),
        '/portoRoute': (context) => PortoView(),
      },
    );
  }
}
