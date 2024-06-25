import 'package:flutter/material.dart';
import 'DiceRoller.dart';
import 'AboutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dice Roller'),
        ),
        drawer: Builder(
          builder: (BuildContext context) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 238, 255),
                    ),
                    child: Text('Dice Roller'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutPage()),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 189, 225, 255),
        body: const Center(
          child: DiceRoller(),
        ),
      ),
    );
  }
}
