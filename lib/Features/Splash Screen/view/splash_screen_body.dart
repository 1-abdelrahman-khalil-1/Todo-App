import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Core/utils/appimages.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/main_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
     if(mounted) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.assetsImagesCircleshape),
        Expanded(
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImages.assetsImagesPlanningImage)),
              SizedBox(height: 50.h),
              Center(
                child: Text(
                  "Get things done with TODO",
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

      ],);
  }
}