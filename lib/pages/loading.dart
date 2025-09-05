import 'package:flutter/material.dart';
import 'package:first_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map data = {};
  bool shouldRun = true;

  void getWorldTime(String location, String url) async {
    await Future.delayed(Duration(seconds: 1));

    WorldTime worldTimeInstance = WorldTime(locationArg: location, urlArg: url);
    await worldTimeInstance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeInstance.location,
      'time': worldTimeInstance.timeStr,
      'date': worldTimeInstance.dateStr,
    });
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;

    if(shouldRun) {
      getWorldTime(data['locationArg'], data['urlArg']);
      shouldRun = false;
    }

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
