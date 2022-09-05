import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/world_api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  void setUpWorldTime() async {
    WorldApi instance =
        WorldApi(location: 'Berlin', flag: 'Germany', url: 'Europe/Berlin');

    await instance.getTime();

    print(instance.time);

    Navigator.pushReplacementNamed(context, '/', arguments: {
      'time': instance.time,
      'location': instance.location,
      'isDay': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitWanderingCubes(color: Colors.yellow, size: 50.0)));
  }
}
