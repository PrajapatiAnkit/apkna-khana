import 'dart:async';

import 'package:apna_khana/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/FOOD.png'),
              alignment: Alignment.center,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "No waiting for food",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }

  loadSplash() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, navigateToHome);
  }

  navigateToHome() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }
}
