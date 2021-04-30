import 'package:flutter/material.dart';
import 'package:worldmap_app/services/DateTime.dart';


class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {

  List<WorldTime> locations = [

    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'America'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'Dubai'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'Pakistan'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'Japan'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'Thailand'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'Australia'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'Germany'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'Russia'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk'),
    WorldTime(url: 'Asia/Kolkata', location: 'Mumbai', flag: 'india'),

  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build function ran");
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue[700],

          title: Text("Choose a location"),
          centerTitle: true,
        ),
        body:ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index){
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                    child: Card(
                      child: ListTile(
                        onTap: (){
                          updateTime(index);
                        },
                        title: Text(locations[index].location,
                        style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),
              
              );
            }
        ),
    );
  }
}
