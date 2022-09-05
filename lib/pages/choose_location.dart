import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_time_app/services/world_api_service.dart';

class ChooseLoaction extends StatefulWidget {
  const ChooseLoaction({Key? key}) : super(key: key);

  @override
  State<ChooseLoaction> createState() => _ChooseLoactionState();
}

class _ChooseLoactionState extends State<ChooseLoaction> {
  List<WorldApi> locations = [
    WorldApi(
      location: 'London',
      flag: 'England',
      url: 'Europe/London',
    ),
    WorldApi(url: 'Europe/Athens', location: 'Athens', flag: 'greece'),
    WorldApi(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt'),
    WorldApi(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya'),
    WorldApi(url: 'America/Chicago', location: 'Chicago', flag: 'usa'),
    WorldApi(url: 'America/New_York', location: 'New York', flag: 'usa'),
    WorldApi(url: 'Asia/Seoul', location: 'Seoul', flag: 'china'),
    WorldApi(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia'),
  ];

  void updateTime(int index) async {
    WorldApi instance = locations[index];

    await instance.getTime();

    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'isDay': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Choose Locatin'), centerTitle: true),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text('${locations[index].location}'),
                      leading: CircleAvatar(
                          child: locations[index].flagImage,
                          backgroundColor: Colors.white)));
            }));
  }
}
