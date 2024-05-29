import 'package:ajudae/constants/colors.dart';
import 'package:ajudae/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.mainColor,
              displayColor: AppColors.mainColor,
              fontFamily: 'Bariol')),
    );
  }
}
