import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Screens/IndividualChatPage.dart';
import 'package:whatsapp/model/chatmodel.dart';

class Chatcard extends StatelessWidget {
  const Chatcard({Key? key, required this.chat}) : super(key: key);
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndividualChatPage(
                chat: chat,
              ),
            ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                chat.isGrp ? Icons.groups : Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Vx.blueGray300,
              radius: 25,
            ),
            trailing: chat.time.text.make(),
            title: chat.name.text.bold.size(16).make(),
            subtitle: Row(
              children: [
                Icon(Icons.done_all).pOnly(right: 10),
                chat.message.text.size(13).make()
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ).pOnly(right: 20, left: 20)
        ],
      ),
    );
  }
}
