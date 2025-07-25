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
  double height = 200;
  double width = 200;
  double borderRaidus = 12;
  Color color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Animated Container Example",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (height == 200 && width == 200) {
                height = 300;
                width = 300;
                color = Colors.deepPurple;
                borderRaidus = 28;
              } else {
                height = 200;
                width = 200;
                color = Colors.pink;
                borderRaidus = 12;
              }
            });
          },
          child: AnimatedContainer(
            height: height,
            width: width,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRaidus),
            ),
          ),
        ),
      ),
    );
  }
}
