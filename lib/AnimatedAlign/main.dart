import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AlignmentGeometry _aligenment = Alignment.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Learn New Widget",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_aligenment == Alignment.bottomLeft) {
                _aligenment = Alignment.topRight;
              } else {
                _aligenment = Alignment.bottomLeft;
              }
            });
          },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.greenAccent,
            child: AnimatedAlign(
              alignment: _aligenment,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Text("Hello world"),
            ),
          ),
        ),
      ),
    );
  }
}
