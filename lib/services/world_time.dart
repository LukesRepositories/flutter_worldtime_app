import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location = "";
  String timeStr = "";
  // String offsetSeconds = "";
  DateTime? time;
  String flagURL = "";
  String url = "";

  WorldTime({String? locationArg, String? urlArg}) {
    location = locationArg ?? "";
    url = urlArg ?? "";
  }

  Future<void> getTime() async {
    Response response = await get(Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=$url'));
    Map data = jsonDecode(response.body);
    print(data);
    location = data['timeZone'];
    timeStr = data['currentLocalTime'];
    // offsetSeconds = data['currentUtcOffset']['seconds'];

    print(location);
    print(timeStr);
    // print(offsetSeconds);

    time = DateTime.tryParse(timeStr);
    // Remember to add offset later
  }

}

// WorldTime worldTimeInstance = WorldTime(locationArg: "London", urlArg: "Europe/London");