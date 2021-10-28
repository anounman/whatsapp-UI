// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final List<String> _code = ['+91', '+0', '+1'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          "Enter your phone number"
              .text
              .teal700
              .bold
              .size(19)
              .makeCentered()
              .pOnly(top: 20, bottom: 20),
          "WhatsApp will send an SMS message to verify your".text.make(),
          RichText(
              text: TextSpan(
                  text: "phone number.",
                  style: TextStyle(color: Colors.black),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <TextSpan>[
                TextSpan(
                    text: "What's my number ?",
                    style: TextStyle(color: Colors.blue))
              ])).pOnly(bottom: 20),
          "India".text.bold.make(),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.teal[700],
          ).pOnly(left: 40, right: 40),
          // Row(
          //   children: [
          //     // DropdownButton(
          //     //   hint: Text(
          //     //       'Please choose a location'), // Not necessary for Option 1
          //     //   onChanged: (newValue) {},
          //     //   items: _code.map((location) {
          //     //     return DropdownMenuItem(
          //     //       child: Text(location),
          //     //       value: location,
          //     //     );
          //     //   }).toList(),
          //     // ),
          //     TextFormField(
          //       textAlignVertical: TextAlignVertical.center,
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //       ),
          //     ),
          //   ],
          // ),
          // // Divider(
          //   height: 20,
          //   thickness: 2,
          //   color: Colors.teal[700],
          // ).pOnly(left: 40, right: 40),
          "Carrier SMS charge may apply"
              .text
              .make()
              .pOnly(bottom: MediaQuery.of(context).size.height / 2),
          Card(
            elevation: 8,
            child: Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width / 4,
              height: 50,
              child: Center(child: "NEXT".text.bold.make()),
            ),
          )
        ],
      ))),
    );
  }
}
