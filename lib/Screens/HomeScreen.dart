import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simdev/Apps/Dice.dart';
import 'package:simdev/Apps/PhotoGallery.dart';
import 'package:simdev/Apps/Quizzler/Quizzler.dart';
import 'package:simdev/Screen/InfoScreen.dart';
import '../Apps/Xylophone.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print("ERROR: $e");
    }
  }

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
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: ListTile(
          title: Text(
            "My Apps",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Info(),
                ),
              );
            },
            icon: Icon(
              Icons.info,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Xylophone(),
                ),
              );
            },
            child: Card(
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('images/Icon/xylophone.jpg'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Xylophone",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "This is a basic Xylophone app. Alike a real \n"
                          "xylophone the seven keys produce seven \n "
                          "different sound when touched. The app \n "
                          "bar also contains an info icon which leads \n"
                          "user to the info page where url luncher is \n"
                          "used to redirect user to email and linkedin.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoGallery(),
                ),
              );
            },
            child: Card(
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('images/Icon/photoGallery.jpg'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Photo Gallery",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "This app shows different images in a \n"
                          "scrollable grid view and allows user to \n"
                          "see each image in a different screen. \n"
                          "This is a basic front end mobile app \n"
                          "designed on Flutter.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DicePage(),
                ),
              );
            },
            child: Card(
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    Image(
                      height: 100,
                      width: 80,
                      image: AssetImage('images/Icon/dice.jpg'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Dice",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "This a virtual dice. Similar to a real dice, \n"
                          "the numbers on the top change when \n"
                          "tapped. This is a basic front end mobile app \n"
                          "designed on flutter.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Quizzler(),
                ),
              );
            },
            child: Card(
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    Image(
                      height: 100,
                      width: 80,
                      image: AssetImage('images/Icon/quizzler.png'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Quizzler",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "This app contains a number of questions in\n"
                              "MCQ format. There's a green tick for every\n"
                              "correct choice and red cross for every\n"
                              "incorrect choice to count you score.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
