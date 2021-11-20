// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:whatsapp/Pages/CameraPage/VideoPreview.dart';
import 'package:whatsapp/Pages/CameraPage/picview.dart';

List<CameraDescription> cameras = [];

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _cameraController;

  late Future<void> cameraValue;
  bool isFront = true;
  bool isFlash = false;
  bool isRecording = false;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isFlash = !isFlash;
                            });
                            isFlash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            isFlash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onTap: () {
                          if (!isRecording) takePhoto(context);
                        },
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videopath =
                              await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoPreview(
                                        path: videopath.path,
                                      )));
                        },
                        child: Container(
                          child: Icon(
                            isRecording
                                ? Icons.radio_button_on
                                : Icons.panorama_fish_eye,
                            size: 70,
                            color: isRecording ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              isFront = !isFront;
                            });
                            int index = isFront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras[index], ResolutionPreset.high);
                            cameraValue = _cameraController.initialize();
                          },
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ))
                    ],
                  ).pOnly(top: 5, bottom: 5),
                  "Hold for video, tap for photo"
                      .text
                      .white
                      .make()
                      .pOnly(top: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

    XFile file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => PicView(
                  path: file.path,
                )));
  }
}
