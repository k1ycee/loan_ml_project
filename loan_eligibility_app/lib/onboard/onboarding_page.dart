import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loan_eligibility_app/assets/assets.gen.dart';
// import 'package:loan_eligibility_app/home/eligibility_check_page.dart';
import 'package:loan_eligibility_app/home/options_page.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/services/storage_service.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 0
                        ? HosTAssets.images.onboard1.image()
                        : HosTAssets.images.onboard2.image(),
                    const Gap(65),
                    Text(
                      pageIndex == 0 ? 'Speedy loan process' : 'Easy Access',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        pageIndex == 0
                            ? 'Very fast application processes with less back and forth running and paperworks'
                            : 'HosT allows you easy access to loans',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 200,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 0 ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all()),
                ),
                const Gap(6),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 1 ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all()),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            right: 30,
            child: Card(
              child: InkWell(
                onTap: () async{
                  if (pageIndex == 1) {
                    navigator.pushTo(const OptionsPage());
                    await StorageService.setOnBoardingStatus(true);
                  } else {
                    setState(() {
                      pageIndex += 1;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.arrow_forward)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
