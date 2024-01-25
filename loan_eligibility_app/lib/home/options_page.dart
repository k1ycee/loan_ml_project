import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loan_eligibility_app/home/eligibility_check_page.dart';
import 'package:loan_eligibility_app/home/eligibility_page_status.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/services/storage_service.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const SizedBox(),
      ),
      body: Column(children: [
        const Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  navigator.pushTo(const EligibilityCheckPage());
                },
                child: Container(
                  height: 190,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Text(
                          'Check Loan Eligibility',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  final prediction = StorageService.getEligibilityValue();
                  navigator.pushTo(LoanEligibilityStatusPage(prediction: prediction,));
                },
                child: Container(
                  height: 190,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Text(
                          'Loan Eligibility Status',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
