// @dart=2.9
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Pages/CameraPage/Camera.dart';
import 'package:whatsapp/Pages/LoginPage.dart';
import 'package:whatsapp/Screens/home.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    // print(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: const Color(0xFF075E54),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFF128C7E))),
      home: LoginScreen(),
    );
  }
}
