import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

  class WorldTime{

    String location;
    String time;
    String flag;
    String url;
    bool isDayTime;  //true or false is daytime or not

    WorldTime( {this.location, this.flag, this.url});


    Future<void> getTime() async {
      // To simulate network request
      Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data=  jsonDecode(response.body);
      print(data);
      String datetime =  data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String off = data['utc_offset'].substring(4,6);

      print(datetime);
      print(offset);
      print(off);


      // create DateTime object
      DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset),minutes: int.parse(off)));
      print(now);

      //set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);


    }
  }
