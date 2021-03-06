import 'package:flutter/material.dart';
import 'package:push_notifications/services/notifications_service.dart';
import 'package:push_notifications/views/fcm_token_view.dart';
import 'package:push_notifications/views/porto_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Register notificationService on the HomeView
    NotificationsService.registerNotificationService(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(FcmTokenView.route);
                },
                child: Text('FCM Token')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PortoView.route);
                },
                child: Text('Porto')),
          ],
        ),
      ),
    );
  }
}
