// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:emoji_picker/emoji_picker.dart';

class IndividualChatPage extends StatefulWidget {
  const IndividualChatPage({Key? key, required this.chat}) : super(key: key);
  final ChatModel chat;
  @override
  _IndividualChatPageState createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  bool show = false;
  late TextEditingController _textEditingController;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        leadingWidth: 80,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View Contact"),
                    value: "Contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media, links , and docs"),
                    value: "Media , links , docs",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute Notification"),
                    value: "Mute Notification",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                  PopupMenuItem(
                    child: Text("More"),
                    value: "More",
                  ),
                ];
              })
        ],
        title: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.chat.name.text.bold.size(16).make(),
              widget.chat.lastSeen.text.size(13).make(),
            ],
          ),
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
              child: Icon(
                widget.chat.isGrp ? Icons.groups : Icons.person,
                color: Colors.white,
              ),
            ).pOnly(left: 5),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                controller: _textEditingController,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "Type a message..",
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.emoji_emotions_outlined,
                                      ),
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    attachment_button());
                                          },
                                        ).pOnly(right: 5),
                                        Icon(Icons.camera_alt)
                                      ],
                                    ).pOnly(right: 10)),
                              ))).p(2),
                      CircleAvatar(
                        backgroundColor: Color(0xFF075E54),
                        radius: 25,
                        child: IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ).pOnly(bottom: 2)
                    ],
                  ),
                  show ? emojiPicker() : Container(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget emojiPicker() {
    return EmojiPicker(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {
          _textEditingController.text =
              _textEditingController.text + emoji.emoji;
        });
      },
    );
  }

  Widget attachment_button() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              attachment_icon_builder(
                  Icons.insert_drive_file, Colors.indigo, "Document"),
              SizedBox(
                width: 40,
              ),
              attachment_icon_builder(Icons.camera_alt, Colors.pink, "camera"),
              SizedBox(
                width: 40,
              ),
              attachment_icon_builder(
                  Icons.insert_photo, Colors.purple, "Gallery"),
            ],
          ).pOnly(top: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              attachment_icon_builder(Icons.headset, Colors.orange, "Audio"),
              SizedBox(
                width: 40,
              ),
              attachment_icon_builder(
                  Icons.location_pin, Colors.pink, "location"),
              SizedBox(
                width: 40,
              ),
              attachment_icon_builder(Icons.person, Colors.blue, "Contact"),
            ],
          ).pOnly(top: 10),
        ]),
      ),
    );
  }

  Widget attachment_icon_builder(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: color,
            child: Icon(icon, size: 29, color: Colors.white),
          ).pOnly(bottom: 5),
          text.text.size(12).make()
        ],
      ),
    );
  }
}
