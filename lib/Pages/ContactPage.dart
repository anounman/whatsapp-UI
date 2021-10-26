// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/UI/ContactCard.dart';
import 'package:whatsapp/UI/CustomButton.dart';
import 'package:whatsapp/model/chatmodel.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<ContactModel> contacts = [
    ContactModel(name: "Ankuh Das", about: "Devloper"),
    ContactModel(name: "Ankuh Das", about: "Devloper"),
    ContactModel(name: "Ankuh Das", about: "Devloper"),
    ContactModel(name: "Ankuh Das", about: "Devloper"),
  ];

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
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ButtonCard(name: "Create Group", icon: Icons.group);
              }
              if (index == 1) {
                return ButtonCard(name: "New Contact", icon: Icons.person_add);
              }
              return ContactCard(
                contactCard: contacts[index],
              );
            }));
  }
}
