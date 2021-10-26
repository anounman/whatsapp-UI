import 'package:flutter/material.dart';
import 'package:whatsapp/Pages/whatsappchat.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
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
              text: "CA",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Text("HI"),
          ChatPage(),
          Text("bye"),
          Text("tata"),
        ],
      ),
    );
  }
}
