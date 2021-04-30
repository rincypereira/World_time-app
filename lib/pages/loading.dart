
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldmap_app/pages/location.dart';
import 'package:worldmap_app/services/DateTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {



  void setWorldTime() async {
    WorldTime instance =  WorldTime(location: 'Mumbai', flag:'India.png' , url:'Asia/Kolkata' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, 'home/', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    }
    );

  }




  @override
  void initState() {
    super.initState();
    setWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100,

      ),
      ),
    );
  }
}