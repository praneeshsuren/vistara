import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vistara/features/auth/presentation/pages/login_page.dart';
import 'package:vistara/firebase_options.dart';
import 'package:vistara/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vistara',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginPage(),
    );
  }
}
