import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';


class ChatScreen extends StatefulWidget {
static String name;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
void getUserDetails () async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  if (user != null){
    ChatScreen.name = user.email;
  }
}
class _ChatScreenState extends State<ChatScreen> {
  String msg;
  @override
  void initState () {
    super.initState();
    getUserDetails();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
       IconButton(
        icon: Icon(Icons.close),
                onPressed: () {
                  final auth = FirebaseAuth.instance;
                  auth.signOut();
                Navigator.push(
                  context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
        ],
       title: Text('⚡️${ChatScreen.name}'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
         Container(
              decoration: kMessageContainerDecoration,
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
           Expanded(
            child: TextField(
                      onChanged: (value) {
                        msg = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
           FlatButton(
                    onPressed: () {
                      final fstore = Firestore.instance;
                      fstore.collection("message").add({"sender": ChatScreen.name, "msg": msg});
                    },
            child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
