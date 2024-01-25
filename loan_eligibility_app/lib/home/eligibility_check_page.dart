import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loan_eligibility_app/api/api_client.dart';
import 'package:loan_eligibility_app/home/eligibility_page_status.dart';
import 'package:loan_eligibility_app/home/widget/credit_history_modal.dart';
import 'package:loan_eligibility_app/home/widget/employment_status_modal.dart';
import 'package:loan_eligibility_app/home/widget/loan_term_modal.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/services/storage_service.dart';
import 'package:loan_eligibility_app/utils/general_model.dart';
import 'package:loan_eligibility_app/widget/text_field_widget.dart';

class EligibilityCheckPage extends StatefulWidget {
  const EligibilityCheckPage({super.key});

  @override
  State<EligibilityCheckPage> createState() => _EligibilityCheckPageState();
}

class _EligibilityCheckPageState extends State<EligibilityCheckPage> {
  final incomeTextEditingController = TextEditingController();
  final coapplicantIncomeTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();
  final loanTermTextEditingController = TextEditingController();
  final creditHistoryTextEditingController = TextEditingController();
  final employmentStatusEditingController = TextEditingController();

  GeneralModel creditHistory = GeneralModel(key: '', value: -1);
  GeneralModel employmentStatus = GeneralModel(key: '', value: -1);
  GeneralModel loanTerm = GeneralModel(key: '', value: -1);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        // leading: const SizedBox(),
        title: const Text(
          'Check loan Eligibility',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(20),
                    CustomTextField(
                      title: 'Credit History',
                      titleColor: Colors.grey,
                      enabled: false,
                      controller: creditHistoryTextEditingController,
                      suffix: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      onTap: () async {
                        creditHistory = (await CreditHistoryModal.show())!;
                        setState(() {
                          creditHistoryTextEditingController.text =
                              creditHistory.key;
                        });
                      },
                    ),
                    CustomTextField(
                      title: 'Employment Status',
                      titleColor: Colors.grey,
                      controller: employmentStatusEditingController,
                      enabled: false,
                      suffix: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      onTap: () async {
                        employmentStatus = (await EmploymentStatusModal.show())!;
                        setState(() {
                          employmentStatusEditingController.text =
                              employmentStatus.key;
                        });
                      },
                    ),
                    CustomTextField(
                      title: 'Income',
                      titleColor: Colors.grey,
                      controller: incomeTextEditingController,
                    ),
                    CustomTextField(
                      title: 'Co-applicant Income(optional)',
                      titleColor: Colors.grey,
                      controller: coapplicantIncomeTextEditingController,
                    ),
                    CustomTextField(
                      title: 'Loan Amount',
                      titleColor: Colors.grey,
                      controller: amountTextEditingController,
                    ),
                    CustomTextField(
                      title: 'Loan Term',
                      titleColor: Colors.grey,
                      controller: loanTermTextEditingController,
                      enabled: false,
                      suffix: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      onTap: () async {
                        loanTerm = (await LoanTermModal.show())!;
                        setState(() {
                          loanTermTextEditingController.text = loanTerm.key;
                        });
                      },
                    ),
                    const Gap(70),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                
                        final prediction = await ApiClient().predict(
                          'https://668f-197-210-226-49.ngrok-free.app/predict_loan_approval',
                          {
                            "Credit_History": loanTerm.value,
                            "Education": 1,
                            "Loan_Amount_Term": loanTerm.value,
                            "ApplicantIncome":
                                int.parse(incomeTextEditingController.text),
                            "CoapplicantIncome": int.parse(
                                coapplicantIncomeTextEditingController.text),
                            "Self_Employed": employmentStatus.value,
                            "LoanAmount":
                                int.parse(amountTextEditingController.text)
                          },
                        );
                        setState(() {
                          isLoading = false;
                        });
                        resetAllFields();
                        await StorageService.setEligibilityValue(prediction);
                        navigator.pushTo(LoanEligibilityStatusPage(
                          prediction: prediction,
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('Check'),
                        ),
                      ),
                    ),
                    const Gap(150),
                  ],
                ),
              ),
            ),
    );
  }

  void resetAllFields() {
    creditHistory = GeneralModel(key: '', value: -1);
    employmentStatus = GeneralModel(key: '', value: -1);
    loanTerm = GeneralModel(key: '', value: -1);
    loanTermTextEditingController.clear();
    employmentStatusEditingController.clear();
    creditHistoryTextEditingController.clear();
    incomeTextEditingController.clear();
    coapplicantIncomeTextEditingController.clear();
    amountTextEditingController.clear();
  }
}
