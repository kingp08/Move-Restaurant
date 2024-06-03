import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreenSecond extends StatefulWidget {
  final CameraDescription camera;
  final void Function(XFile pic) onTake;
  final void Function() onSkip;
  const TakePictureScreenSecond({required this.camera, Key? key, required this.onTake, required this.onSkip}) : super(key: key);

  @override
  TakePictureScreenSecondState createState() => TakePictureScreenSecondState();
}

class TakePictureScreenSecondState extends State<TakePictureScreenSecond> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: CameraPreview(
                        _controller,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/corner_top_left.png", color: Colors.white),
                                Image.asset("assets/images/corner_top_right.png", color: Colors.white),
                              ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/corner_bottom_left.png", color: Colors.white),
                                  Image.asset("assets/images/corner_bottom_right.png", color: Colors.white),
                                ]
                            )
                          ],
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();
                      Navigator.of(context).pop();
                      widget.onTake(image);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 56.0, vertical: 32.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF70B62C),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [BoxShadow(color: Color(0XFF6FB52C).withAlpha(50), offset: Offset(0, 4), blurRadius: 20.0)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/square.png", height: 32, width: 32),
                        SizedBox(width: 8),
                        Text("Take Photo", style: const TextStyle(fontFamily: "Poppinsm", color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}