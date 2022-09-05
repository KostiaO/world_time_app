import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:intl/intl.dart';

class WorldApi {
  late String time;
  String location;
  String url;
  String flag;
  late bool isDaytime;

  WorldApi({required this.location, required this.flag, required this.url});

  Widget get flagImage {
    return Image(
        image: NetworkImage('https://countryflagsapi.com/png/${flag}'));
  }

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map decodedResponseBody = await jsonDecode(response.body);

      String datetime = decodedResponseBody['datetime'];

      String offset =
          decodedResponseBody['utc_offset'].toString().substring(1, 3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      print(now.hour);

      isDaytime = now.hour > 6 && now.hour < 20;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error: $e');
      time = 'coud not load time';
    }
  }
}
