import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = "";
  String timeStr = "";
  String dateStr = "";
  // String offsetSeconds = "";
  String flagURL = "";
  String url = "";

  WorldTime({String? locationArg, String? urlArg}) {
    location = locationArg ?? "";
    url = urlArg ?? "";
  }



  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      print(data);
      timeStr = data['currentLocalTime'];
      // offsetSeconds = data['currentUtcOffset']['seconds'];

      DateTime? time = DateTime.tryParse(timeStr);
      // Remember to add offset later

      timeStr = DateFormat.jm().format(time!);
      dateStr = DateFormat('dd-MMM-yyyy').format(time);
    } catch(e) {
      timeStr = "There was an error loading the API data";
    }


  }

}

// WorldTime worldTimeInstance = WorldTime(locationArg: "London", urlArg: "Europe/London");