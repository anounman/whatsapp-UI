// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Pages/LoginPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            "Welcome To WhatsApp".text.size(29).bold.teal700.make().pOnly(
                top: 50,
                // left: 40,
                bottom: MediaQuery.of(context).size.height / 13.5),
            Center(
              child: Image.asset(
                "assets/images/bg.png",
                color: Colors.greenAccent[700],
                height: 340,
                width: 340,
              ),
            ).pOnly(bottom: MediaQuery.of(context).size.height / 13.5),
            "Agree and contnue to accept the WhtsApp".text.make(),
            "Terms of Service and Privacy Policy".text.blue500.make(),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => LoginPage())),
              child: Card(
                elevation: 8,
                child: Container(
                  height: 50,
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width - 110,
                  child: Center(
                      child: "Accept And Continue"
                          .text
                          .uppercase
                          .white
                          .center
                          .make()),
                ).pOnly(top: 5),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
