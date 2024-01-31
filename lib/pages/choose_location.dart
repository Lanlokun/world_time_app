import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        isDaytime: false),
    WorldTime(
        url: 'Europe/Athens',
        location: 'Athens',
        flag: 'greece.png',
        isDaytime: false),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        isDaytime: false),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        isDaytime: false),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        isDaytime: false),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        isDaytime: false),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        isDaytime: false),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        isDaytime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build function ran");
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                      child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  )));
            }));
  }
}
