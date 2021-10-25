import 'package:flutter/cupertino.dart';

class ChatModel {
  late String name;
  late Icon icon;
  late bool isGrp;
  late String time;
  late String message;
  late String lastSeen;

  ChatModel({
    required this.name,
    required this.icon,
    required this.isGrp,
    required this.message,
    required this.time,
    required this.lastSeen,
  });
}
