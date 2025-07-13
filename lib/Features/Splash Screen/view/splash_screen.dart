import 'package:flutter/material.dart';
import 'package:to_do/Core/utils/appimages.dart';
import 'package:to_do/Features/Splash%20Screen/view/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SplashScreenBody()
    
    ));
  }
}