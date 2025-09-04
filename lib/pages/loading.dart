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

  void getWorldTime() async {
    WorldTime worldTimeInstance = WorldTime(locationArg: data['locationArg'], urlArg: data['urlArg']);
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
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    getWorldTime();
    Future.delayed(Duration(seconds: 2));

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
