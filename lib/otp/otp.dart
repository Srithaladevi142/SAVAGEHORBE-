import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget{
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
 String uid='';

getUid() {}

  @override
  void initState(){
    this.uid='';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid=val.uid;
      });
    }).catchError((e) {
      print(e);
    });
      super.initState();
    }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You are now logged in as $uid'),
              SizedBox(
                height: 15.0,
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color:Colors.red,style: BorderStyle.solid,width:3.0),
                  child: Text('Logout'),
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}