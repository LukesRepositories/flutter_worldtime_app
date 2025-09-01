import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String location = "";
  String time = "";

  void getTime() async {
    Response response = await get(Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=Europe/London'));
    Map data = jsonDecode(response.body);
    print(data);
    location = data['timeZone'];
    time = data['currentLocalTime'];

    print(location);
    print(time);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Loading"),
      ),

    );
  }
}
