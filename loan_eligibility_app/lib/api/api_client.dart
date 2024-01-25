import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:loan_eligibility_app/api/exception.dart';


class ApiClient {
  final dio = Dio();
  static String? dir;




  

//Download file from url
  Future<int> predict(String url, Map<String, dynamic> body) async {
    try {
      Response response = await dio.post<String>(
        url,
        // options: Options(responseType: ResponseType.bytes),
        data: body
      );
      final prediction = json.decode(response.data)['prediction'];
      return prediction;
    } on DioException catch (e) {
      throw RequestException(message: e.message!, trace: e.stackTrace);
    }
  }
}
