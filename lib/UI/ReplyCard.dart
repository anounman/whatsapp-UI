// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  '''Hey This is a reply this is from static code
                  '''
                      .text
                      .size(16)
                      .make()
                      .pOnly(top: 10, left: 10, right: 60, bottom: 5),
                  Positioned(
                    bottom: 4,
                    right: 10,
                    child: "20:20".text.size(13).black.make().pOnly(right: 5),
                  ),
                ],
              ))),
    );
  }
}
