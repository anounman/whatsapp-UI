// @dart=2.9
import 'package:flutter/material.dart';
import 'package:whatsapp/Pages/CameraPage/Camera.dart';
import 'package:whatsapp/Pages/whatsappchat.dart';
import 'package:whatsapp/model/chatmodel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.chatmodel, this.sourceChat}) : super(key: key);
  final List<ChatModel> chatmodel;
  final ChatModel sourceChat;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("New Group"),
                    value: "New Group",
                  ),
                  const PopupMenuItem(
                    child: Text("New bordcast"),
                    value: "New bordcast",
                  ),
                  const PopupMenuItem(
                    child: Text("Linked device"),
                    value: "Linked Deviced",
                  ),
                  const PopupMenuItem(
                    child: Text("Setting"),
                    value: "Setting",
                  ),
                ];
              })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: "CHAT",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Camera(),
          ChatPage(
            sourcechat: widget.sourceChat,
          ),
          Text("bye"),
          Text("tata"),
        ],
      ),
    );
  }
}
