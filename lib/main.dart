import 'package:flutter/material.dart';
import 'package:newnow/views/AuthPages/log_In.dart';
import 'package:newnow/views/AuthPages/sign_up.dart';
import 'package:newnow/views/main_page.dart';
import 'package:newnow/views/main_screens/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://osgggqoxbtvtjpijaqes.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9zZ2dncW94YnR2dGpwaWphcWVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc3MjU2MzksImV4cCI6MjA1MzMwMTYzOX0.NNoyi5vqZkG6YXeRt7Z820RWLRBCiRyGmH_4xAVbCOc');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const LogIn(),
      routes: {
        '/SignUp': (context) => SignUp(),
        '/LogIn': (context) => LogIn(),
        '/HomePage': (context) => HomePage(),
        '/MainPage': (context) => MainPage(),
      },
    );
  }
}
