import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Map> locations = [
    {'locationArg': "London", 'urlArg': "Europe/London"},
    {'locationArg': "Paris", 'urlArg': "Europe/Paris"},
    {'locationArg': "Berlin", 'urlArg': "Europe/Berlin"},
    {'locationArg': "Cairo", 'urlArg': "Africa/Cairo"},
    {'locationArg': "Lagos", 'urlArg': "Africa/Lagos"},
    {'locationArg': "Nairobi", 'urlArg': "Africa/Nairobi"},
    {'locationArg': "Tokyo", 'urlArg': "Asia/Tokyo"},
    {'locationArg': "Bangkok", 'urlArg': "Asia/Bangkok"}
  ];

  void updateLocation(index) async {
    Navigator.pushNamed(context, '/loading', arguments: locations[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateLocation(index);
              },
              title: Text(locations[index]['locationArg']),
              leading: CircleAvatar(backgroundImage: AssetImage('resources/images/Police_car.png'),),
              tileColor: Colors.teal[100],
            ),
          );
        },
      )
    );
  }
}
