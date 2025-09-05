import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Map> locations = [
    {'locationArg': "London", 'urlArg': "Europe/London", 'flag': 'united-kingdom.png'},
    {'locationArg': "Paris", 'urlArg': "Europe/Paris", 'flag': 'france.png'},
    {'locationArg': "Berlin", 'urlArg': "Europe/Berlin", 'flag': 'germany.png'},
    {'locationArg': "Cairo", 'urlArg': "Africa/Cairo", 'flag': 'egypt.png'},
    {'locationArg': "Lagos", 'urlArg': "Africa/Lagos", 'flag': 'nigeria.png'},
    {'locationArg': "Nairobi", 'urlArg': "Africa/Nairobi", 'flag': 'kenya.png'},
    {'locationArg': "Tokyo", 'urlArg': "Asia/Tokyo", 'flag': 'japan.png'},
    {'locationArg': "Bangkok", 'urlArg': "Asia/Bangkok", 'flag': 'thailand.png'}
  ];

  void updateLocation(index) async {
    Navigator.pushNamed(context, '/loading', arguments: locations[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
            child: RichText(
              text: TextSpan(
                text: "Choose Location",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                ),
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      updateLocation(index);
                    },
                    title: Text(locations[index]['locationArg']),
                    leading: CircleAvatar(backgroundImage: AssetImage('resources/images/${locations[index]['flag']}')),
                    tileColor: Colors.teal[100],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
