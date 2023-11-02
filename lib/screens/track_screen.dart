import 'dart:io';
// import 'dart:convert';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;

class TrackScreen extends StatefulWidget {
  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          imageFile == null
              ? Image.asset(
                  "assets/images/splash_screen.png",
                  height: 300.0,
                  width: 300.0,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(150.0),
                  child: Image.file(
                    imageFile!,
                    height: 300.0,
                    width: 300.0,
                    fit: BoxFit.fill,
                  )),
          const SizedBox(
            height: 20.0,
          ),
          addFood(context),
        ],
      ),
    );
  }

  final picker = ImagePicker();

  Widget addFood(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(50, 75, 80, 1),
        foregroundColor: const Color.fromRGBO(222, 230, 232, 1),
      ),
      onPressed: () async {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          Permission.camera,
        ].request();
        if (statuses[Permission.storage]!.isGranted &&
            statuses[Permission.camera]!.isGranted) {
          showImagePicker(context);
        } else {
          print("no permission provided");
        }
      },
      child: const Text("Add Food"),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Container(
                color: const Color.fromRGBO(222, 230, 232, 1),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Pick Image From",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(50, 75, 80, 1),
                          foregroundColor:
                              const Color.fromRGBO(222, 230, 232, 1),
                        ),
                        onPressed: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text("CAMERA"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(50, 75, 80, 1),
                          foregroundColor:
                              const Color.fromRGBO(222, 230, 232, 1),
                        ),
                        onPressed: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.image),
                        label: const Text("GALLERY"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(50, 75, 80, 1),
                          foregroundColor:
                              const Color.fromRGBO(222, 230, 232, 1),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("CANCEL"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        setState(() {
          imageFile = File(value.path);
        });
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        setState(() {
          imageFile = File(value.path);
        });
      }
    });
  }
}
