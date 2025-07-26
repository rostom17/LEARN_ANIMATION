import 'package:flutter/material.dart';
/*
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TweenAnimationBuilder Sample')),
        body: const Center(child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          icon: const Icon(Icons.aspect_ratio),
          onPressed: () {
            setState(() {
              _targetValue = _targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
    );
  }
}
*/

/// Tween animation Builder with TweenColor

/*
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
  bool isRed = false;
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
        child: TweenAnimationBuilder(
          tween: ColorTween(
            begin: Colors.transparent,
            end: isRed ? Colors.red : Colors.blue,
          ),
          duration: const Duration(seconds: 1),
          builder: (context, color, child) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isRed = !isRed;
                });
              },
              child: Container(height: 200, width: 200, color: color),
            );
          },
        ),
      ),
    );
  }
}
*/

//opacity with tween
/*
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
  bool isTrasparent = false;

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
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: isTrasparent ? .2 : 1.0),
          duration: const Duration(milliseconds: 500),
          builder: (context, opacity, child) {
            return Opacity(opacity: opacity, child: child);
          },
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTrasparent = !isTrasparent;
              });
            },
            child: Text(
              "Hello WOrld",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

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
  bool isBig = true;
  bool isRed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Nested Tweeen Learning",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isBig ? 1 : 0.5),
          duration: const Duration(seconds: 1),
          builder: (context, scale, child) {
            return TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: Colors.blue,
                end: isRed ? Colors.red : Colors.blue,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, color, child) {
                return Transform.scale(
                  scale: scale,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isBig = !isBig;
                        isRed = !isRed;
                      });
                    },
                    child: Container(width: 200, height: 200, color: color),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
