import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/services/notifications_service.dart';
import 'package:push_notifications/views/fcm_token_view.dart';
import 'package:push_notifications/views/initial_view.dart';
import 'package:push_notifications/views/porto_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/fcmKeyRoute': (context) => FcmTokenView(),
        '/portoRoute': (context) => PortoView(),
      },
    );
  }
}
