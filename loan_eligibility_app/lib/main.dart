import 'package:flutter/material.dart';
import 'package:loan_eligibility_app/onboard/splash_page.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:loan_eligibility_app/services/storage_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.key,
      home: const SplashScreen(),
    );
  }
}

