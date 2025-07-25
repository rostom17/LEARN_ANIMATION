// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: SwitcherDemo());
//   }
// }

// class SwitcherDemo extends StatefulWidget {
//   const SwitcherDemo({super.key});

//   @override
//   State<SwitcherDemo> createState() => _SwitcherDemoState();
// }

// class _SwitcherDemoState extends State<SwitcherDemo> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('AnimatedSwitcher Demo')),
//       body: Center(
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 500),
//           switchInCurve: Curves.bounceIn,
//           transitionBuilder: (child, animation) {
//             final offsetAnimation = Tween<Offset>(
//               begin: const Offset(
//                 2.0, //dx (negative from left side and positive from right side)
//                 1.0, //dy (negative from top and positive from bottom)
//               ), // 2 step form right, 1 step form down, that means form bottom corner
//               end: Offset.zero,
//             ).animate(animation);

//             return SlideTransition(
//               position: offsetAnimation,
//               child: ScaleTransition(scale: animation, child: child),
//               //child: child,
//             );
//           },
//           child: Text(
//             '$_counter',
//             key: ValueKey<int>(_counter),
//             style: const TextStyle(fontSize: 48),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _increment,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

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
  int _selectedIdex = 0;
  final List<Widget> pages = [ProfilePage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Animated Switcher",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(
                2.0, //dx (negative from left side and positive from right side)
                1.0, //dy (negative from top and positive from bottom)
              ), // 2 step form right, 1 step form down, that means form bottom corner
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          child: pages[_selectedIdex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIdex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIdex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 500, width: 200, color: Colors.pink);
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200, width: 300, color: Colors.deepPurple);
  }
}
