import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/model/chatmodel.dart';

class IndividualChatPage extends StatefulWidget {
  const IndividualChatPage({Key? key, required this.chat}) : super(key: key);
  final ChatModel chat;
  @override
  _IndividualChatPageState createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        leadingWidth: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.chat.name.text.bold.size(16).make(),
            widget.chat.lastSeen.text.size(13).make(),
          ],
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back).pOnly(left: 3),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Vx.blueGray300,
              child: Icon(widget.chat.isGrp ? Icons.groups : Icons.person),
            ).pOnly(left: 5),
          ],
        ),
      ),
    );
  }
}
