// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/model/chatmodel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contactModel}) : super(key: key);
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CircleAvatar(
                radius: 23,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                backgroundColor: Vx.blueGray300,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contactModel.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
