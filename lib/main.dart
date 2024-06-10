import 'package:flutter/material.dart';
import 'package:secret_notes/add_notes.dart';
import 'package:secret_notes/full_note.dart';
import 'package:secret_notes/home.dart';
import 'package:secret_notes/login.dart';
import 'package:secret_notes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:secret_notes/pdf.dart';
import 'package:secret_notes/subject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SecretesNotes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade200),
          useMaterial3: true,
        ),
        // ignore: prefer_const_constructors
        home: Home());
  }
}
