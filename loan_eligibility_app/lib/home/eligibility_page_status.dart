import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoanEligibilityStatusPage extends StatefulWidget {
  const LoanEligibilityStatusPage({super.key, required this.prediction});
  final int prediction;

  @override
  State<LoanEligibilityStatusPage> createState() =>
      _LoanEligibilityStatusPageState();
}

class _LoanEligibilityStatusPageState extends State<LoanEligibilityStatusPage> {
  // bool isEligible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             widget.prediction == 1 ? 'YES' : 'NO',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Gap(30),
            Text(
              widget.prediction == 1 
                  ? 'Congratulations, you are eligible for a loan'
                  : 'Sorry, you are not eligible for a loan',
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
