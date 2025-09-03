import 'package:flutter/material.dart';
import 'package:first_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading...";

  void getWorldTime() async {
    WorldTime worldTimeInstance = WorldTime(locationArg: "London", urlArg: "Europe/London");
    await worldTimeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeInstance.location,
      'time': worldTimeInstance.timeStr,
      'date': worldTimeInstance.dateStr,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.teal[600],
          size: 80.0,
        )
      )
    );
  }
}
