import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: Text("Home")),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            child: Text("locationScreen"),
          ),
          Text(data['time'])

        ],
      ),
    );
  }
}
