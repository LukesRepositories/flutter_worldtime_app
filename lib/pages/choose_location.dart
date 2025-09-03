import 'package:first_flutter/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(locationArg: "London", urlArg: "Europe/London"),
    WorldTime(locationArg: "Paris", urlArg: "Europe/Paris"),
    WorldTime(locationArg: "Berlin", urlArg: "Europe/Berlin"),
    WorldTime(locationArg: "Cairo", urlArg: "Africa/Cairo"),
    WorldTime(locationArg: "Lagos", urlArg: "Africa/Lagos"),
    WorldTime(locationArg: "Nairobi", urlArg: "Africa/Nairobi"),
    WorldTime(locationArg: "Tokyo", urlArg: "Asia/Tokyo"),
    WorldTime(locationArg: "Bangkok", urlArg: "Asia/Bangkok")
  ];

  void updateLocation(index) async {
    WorldTime worldTimeInstance = locations[index];
    await worldTimeInstance.getTime();
    Navigator.pop(context, {
    'location': worldTimeInstance.location,
    'time': worldTimeInstance.timeStr,
    'date': worldTimeInstance.dateStr,
    });
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
              title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('resources/images/Police_car.png'),),
              tileColor: Colors.teal[100],
            ),
          );
        },
      )
    );
  }
}
