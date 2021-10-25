import 'package:flutter/material.dart';
import 'package:whatsapp/UI/chatcard.dart';
import 'package:whatsapp/model/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Ankush Das",
        icon: Icon(Icons.person),
        isGrp: false,
        message: "Hi i am Joy",
        time: "18:09",
        lastSeen: "Today at 10:00"),
    ChatModel(
        name: "Aritra Das",
        icon: Icon(Icons.person),
        isGrp: false,
        message: "Hi i am Aritra",
        time: "18:09",
        lastSeen: "Today at 10:00"),
    ChatModel(
        name: "Amrtua Das",
        icon: Icon(Icons.person),
        isGrp: false,
        message: "Hi i am Amrtya",
        time: "18:09",
        lastSeen: "Today at 10:00"),
    ChatModel(
        name: "joy Das",
        icon: Icon(Icons.person),
        isGrp: false,
        message: "Hi i am Joy",
        time: "18:09",
        lastSeen: "Today at 10:00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.chat),
          ),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => Chatcard(
                  chat: chats[index],
                )));
  }
}
