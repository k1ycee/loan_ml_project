import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/utils/employment_status.dart';
import 'package:loan_eligibility_app/utils/general_model.dart';
import 'package:loan_eligibility_app/widget/bottomSheet.dart';

class EmploymentStatusModal extends StatefulWidget {
  const EmploymentStatusModal({super.key});

  static Future<GeneralModel?> show() => CustomBottomSheet.show<GeneralModel>(
        child: const EmploymentStatusModal(),
        padding: EdgeInsets.zero,
      );

  @override
  State<EmploymentStatusModal> createState() => _EmploymentStatusModalState();
}

class _EmploymentStatusModalState extends State<EmploymentStatusModal> {
  GeneralModel selectedValue = GeneralModel(key: '', value: -1);
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      height: 300,
      child: Column(
        children: [
          const Gap(24),
          const Text(
            'Are you self-employed?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          const Gap(24),
          ...employmentStatus
              .map<Widget>(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedValue = e;
                    });
                    navigator.pop(selectedValue);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.key,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: selectedValue == e
                                  ? Colors.green
                                  : Colors.grey,
                              width: selectedValue == e ? 6 : 1),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .intersperse(const Gap(24))
        ],
      ),
    );
  }
}
