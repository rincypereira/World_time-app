import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldmap_app/pages/location.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background image
    String bgImage = data['isDayTime'] ? 'morningsky.jpg' : 'n.jpg' ;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton.icon(

                    onPressed: () async {
                     dynamic  result = await Navigator.pushNamed(context, 'location/');
                     setState(() {
                       data = {
                         'time' : result['time'],
                          'location' : result['location'],
                         'isDayTime' : result['isDayTime' ],
                         'flag' : result['flag']
                       };
                     });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("edit location",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                           fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( data['location'] ,
                        style: TextStyle(fontSize: 20,
                        letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text( data['time'],
                    style: TextStyle(fontSize: 60),
                  ),

                ],
              )
          ),
        ),
      ) ,
    );
  }
}