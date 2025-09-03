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

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SafeArea(child: Text("Home")),
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                if(result != null) {
                  setState(() {
                    data = {
                      'location': result['location'],
                      'time': result['time'],
                      'date': result['date'],
                    };
                  });
                }
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
