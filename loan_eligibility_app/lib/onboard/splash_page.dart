import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loan_eligibility_app/assets/assets.gen.dart';
import 'package:loan_eligibility_app/home/eligibility_check_page.dart';
import 'package:loan_eligibility_app/home/options_page.dart';
import 'package:loan_eligibility_app/onboard/onboarding_page.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (StorageService.getOnBoardingStatus()) {
        navigator.pushTo(const OptionsPage());
      } else {
        navigator.pushTo(const OnboardingPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HosTAssets.images.logo.svg(),
            const Gap(8),
            const Text(
              'HosT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
