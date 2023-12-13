import 'package:flutter/material.dart';
import 'package:reservafiz/ui/homepage.dart';
import 'package:reservafiz/ui/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservafiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 183, 61, 9)),
        useMaterial3: true,
      ),
      routes: {
        '/main': (context) => MainPage(),
        // Rute lainnya jika diperlukan
      },
      home: HomePage(),
    );
  }
}
