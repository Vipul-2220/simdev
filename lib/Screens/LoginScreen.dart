import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simdev/CurveClipper.dart';
import 'package:simdev/Screen/HomeScreen.dart';
import 'package:simdev/Screen/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _auth = FirebaseAuth.instance;
  String email, password;
  bool showSpinner = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Image(
                    image: AssetImage("images/login_background.jpg"),
                    height: MediaQuery.of(context).size.height/2.5,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "SimDev Flutter",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: TextField(
                    onChanged: (value){
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      prefixIcon: Icon(Icons.mail,
                        size: 30,
                      ),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: TextField(
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      prefixIcon: Icon(Icons.lock,
                        size: 30,
                      ),
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      else if(user == null){
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    }
                    catch(e){
                      print("ERROR: $e");
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    height: 45,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> SignupScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Theme.of(context).primaryColor,
                        height: 60.0,
                        child: Text(
                          "Don\'t have an account? SignUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
