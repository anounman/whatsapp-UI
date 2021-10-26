// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Pages/CreateGroup.dart';
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
    ContactModel(name: "Joy Das", about: "Devloper Web"),
    ContactModel(name: "Aritra Das", about: "web Devloper"),
    ContactModel(name: "Amrtya Sankar Das", about: "App Devloper"),
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
              "Create Group".text.size(19).bold.make(),
              "300 Contacts".text.size(13).make(),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup())),
                    child: ButtonCard(name: "Create Group", icon: Icons.group));
              }
              if (index == 1) {
                return ButtonCard(name: "New Contact", icon: Icons.person_add);
              }
              return ContactCard(
                contactCard: contacts[index - 2],
              );
            }));
  }
}
