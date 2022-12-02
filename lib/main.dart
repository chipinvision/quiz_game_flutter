/////////////////////////////////////////////////
// Instagram: @invisionchip
// Github: https://github.com/chipinvision
// LIKE | SHARE | FOLLOW
/////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:quiz_app/views/quizview.dart';
import '/utilities/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Game',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Quiz Game",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let\'s test your knowledge",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: primaryColor,
              ),
            ),
            const SizedBox(height:40),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizView()));
              },
              color: primaryColor,
              child: const Text(
                "PLAY",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: bgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
