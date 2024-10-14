import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HomeScreen.dart';

class Info extends StatefulWidget {
  const Info({Key key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text(
          "THIC ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blueAccent],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.5, 0.0),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/vipul.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                color: Colors.white30,
                elevation: 20,
                child: Text(
                  'Vipul Kumar',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                color: Colors.white24,
                elevation: 20,
                child: Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                color: Colors.white24,
                elevation: 20,
                child: Text(
                  'THATS HOW I CODE',
                  style: TextStyle(
                      fontFamily: 'Satisfy',
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
                width: 200,
                child: Divider(
                  color: Colors.black54,
                  thickness: 0.8,
                ),
              ),
              Card(
                elevation: 20.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25,),
                child: GestureDetector(
                  onTap: () async {
                    const url = 'https://www.linkedin.com/in/vipul-singh-a5b815153/';
                    if(await canLaunch(url)){
                      await launch(url);
                    } else {
                      throw 'Could not launch';
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.web,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Text(
                      'LinkedIn',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 20.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25,),
                child: GestureDetector(
                  onTap: () async {
                    const url = 'mailto:kumarvipul479@gmail.com?subject=News&body=New%20plugin';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
