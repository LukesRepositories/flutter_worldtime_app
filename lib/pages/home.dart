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
      body: Center(
        child: Column(
          children: [
            SafeArea(child: Text("Home")),
            ElevatedButton.icon(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: Icon(Icons.edit_location),
              label: Text("Choose Location"),
            ),
            SizedBox(height: 20.0),
            Text(
              data['location'],
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 60.0,
              ),
            ),
            Text(
              data['date'],
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
