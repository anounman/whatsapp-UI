// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:whatsapp/Screens/home.dart';
import 'package:whatsapp/UI/CustomButton.dart';
import 'package:whatsapp/model/chatmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
        name: "Dev Stack",
        message: "Hello",
        time: "12:00",
        id: 1,
        isGrp: false,
        icon: Icon(Icons.person),
        lastSeen: ''),
    ChatModel(
        name: "Dev Stack",
        message: "Hello",
        time: "12:00",
        id: 2,
        isGrp: false,
        icon: Icon(Icons.person),
        lastSeen: ''),
    ChatModel(
        name: "Dev Stack",
        message: "Hello",
        time: "12:00",
        id: 3,
        isGrp: false,
        icon: Icon(Icons.person),
        lastSeen: ''),
    ChatModel(
        name: "Dev Stack",
        message: "Hello",
        time: "12:00",
        id: 4,
        isGrp: false,
        icon: Icon(Icons.person),
        lastSeen: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (contex, index) => InkWell(
                onTap: () {
                  sourceChat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => HomeScreen(
                                chatmodel: chatmodels,
                                sourceChat: sourceChat,
                              )));
                },
                child: ButtonCard(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
