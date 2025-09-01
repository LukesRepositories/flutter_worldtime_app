import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  String foo1 = "Loading...";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    setState(() {
      foo1 = data['title'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.teal,
            title: Text("Choose_location"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text("loadingScreen"),
          ),
          Text(foo1)
        ],
      ),
    );
  }
}
