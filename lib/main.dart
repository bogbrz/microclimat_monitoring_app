import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/app/injection_container.dart';
import 'package:microclimat_monitoring_app/firebase_options.dart';
import 'package:microclimat_monitoring_app/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
