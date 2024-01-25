import 'package:loan_eligibility_app/utils/general_model.dart';

List<GeneralModel> loanTerm = List.generate(
  3650,
  (index) {
    return GeneralModel(
        key: '${index + 1} ${plural(index + 1)}', value: index + 1);
  },
);

String plural(int index) {
  if (index > 1) {
    return 'days';
  } else {
    return 'day';
  }
}



