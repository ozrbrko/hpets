import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hpets/router.dart';
import 'package:logger/logger.dart';


Logger logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2,
      // number of method calls to be displayed
      errorMethodCount: 8,
      // number of method calls if stacktrace is provided
      lineLength: 120,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  ),
);

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hPets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/splash',
      routes: routes,

    );
  }
}


