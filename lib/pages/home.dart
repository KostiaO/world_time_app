import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/world_api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;

    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/${data['isDay'] ? 'day.png' : 'night.png'}'))),
            child: Padding(
              padding: EdgeInsets.all(100.0),
              child: Column(
                children: [
                  Text('Actual time:',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 30.0,
                      )),
                  Text('${data['time']}',
                      style: TextStyle(
                          backgroundColor: Colors.black12,
                          color: data['isDay'] ? Colors.yellow : Colors.blue,
                          fontSize: 42.0)),
                  SizedBox(height: 8.0),
                  Text(data['location'],
                      style:
                          TextStyle(color: Colors.yellow[800], fontSize: 40.0)),
                  SizedBox(height: 8.0),
                  FlatButton.icon(
                      onPressed: (() async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDay': result['isDay']
                          };
                        });

                        print(result['isDay']);
                      }),
                      color: Colors.grey[900],
                      icon: Icon(Icons.rocket, color: Colors.yellow[900]),
                      label: Text('Select Location',
                          style: TextStyle(color: Colors.yellow[900])))
                ],
              ),
            )),
      ),
    );
  }
}
