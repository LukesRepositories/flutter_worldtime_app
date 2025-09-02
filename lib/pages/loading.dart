import 'package:flutter/material.dart';
import 'package:first_flutter/services/world_time.dart';

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
    setState(() {
      time = worldTimeInstance.timeStr;
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
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.teal,
            title: Text("LoadingScreen"),
          ),
          Text(time),
        ],
      ),

    );
  }
}
