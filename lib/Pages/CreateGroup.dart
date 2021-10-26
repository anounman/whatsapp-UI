// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Pages/CreateGroup.dart';
import 'package:whatsapp/UI/AvtarCard.dart';
import 'package:whatsapp/UI/ContactCard.dart';
import 'package:whatsapp/UI/CustomButton.dart';
import 'package:whatsapp/model/chatmodel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ContactModel> contacts = [
    ContactModel(name: "Ankuh Das", about: "Devloper"),
    ContactModel(name: "Joy Das", about: "Devloper Web"),
    ContactModel(name: "Aritra Das", about: "web Devloper"),
    ContactModel(name: "Amrtya Sankar Das", about: "App Devloper"),
  ];
  List<ContactModel> grps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Select Contact".text.size(19).bold.make(),
              "300 Contacts".text.size(13).make(),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
            PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("Invites a friend"),
                      value: "invite",
                    ),
                    PopupMenuItem(
                      child: Text("Contatcs"),
                      value: "Contact",
                    ),
                    PopupMenuItem(
                      child: Text("Refresh"),
                      value: "Refresh",
                    ),
                    PopupMenuItem(
                      child: Text("Help"),
                      value: "help",
                    ),
                  ];
                })
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: grps.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (contacts[index - 1].isSelected == false) {
                        // print(index);
                        setState(() {
                          contacts[index - 1].isSelected = true;
                          grps.add(contacts[index - 1]);
                        });
                      } else {
                        setState(() {
                          contacts[index - 1].isSelected = false;
                          grps.remove(contacts[index - 1]);
                        });
                      }
                    },
                    child: ContactCard(
                      contactCard: contacts[index - 1],
                    ),
                  );
                }),
            grps.length > 0
                ? Column(
                    children: [
                      Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: grps.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        contacts[index].isSelected = false;
                                        grps[index].isSelected = false;
                                        grps.remove(grps[index]);
                                      });
                                    },
                                    child:
                                        AvatarCard(contactModel: grps[index]));
                              })),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container()
          ],
        ));
  }
}
