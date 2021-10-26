// ignore_for_file: prefer_const_constructors, file_names
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/model/chatmodel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contactCard}) : super(key: key);
  final ContactModel contactCard;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  backgroundColor: Vx.blueGray300,
                  radius: 25,
                ),
                title: contactCard.name.text.bold.size(16).make(),
                subtitle: contactCard.about.text.size(13).make()),
          ],
        ),
        contactCard.isSelected?CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 11,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ).pOnly(top: 40, left: 45)
        : Container()
      ],
    );
  }
}
