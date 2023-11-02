// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:food_classification_app/models/nutrition_detail.dart';
import 'package:food_classification_app/models/treck.dart';
import 'package:food_classification_app/providers/trecks_provider.dart';
import 'package:food_classification_app/screens/nutrition_screen.dart';
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;
  final picker = ImagePicker();
  DateTime _selectedDate = DateTime.now();

  NutritionDetail nd = NutritionDetail();
  Nutrition? nt;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TrecksProvider>(context);
    List<Treck> treck = provider.giveTrecksOnDate(_selectedDate);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Text(
                      "Today",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              addFood(context, provider),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: DatePicker(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 4),
            height: 90,
            width: 60,
            initialSelectedDate: DateTime.now(),
            selectionColor: const Color.fromRGBO(50, 75, 80, 1),
            selectedTextColor: const Color.fromRGBO(222, 230, 232, 1),
            dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemCount: treck.length,
                itemBuilder: (context, index) {
                  String food = treck[index].name!;
                  nt = nd.details[food];
                  return ListTile(
                    // visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromRGBO(50, 75, 80, 0.5),
                      child: Image.asset(nt!.imgUrl as String),
                    ),
                    title: Text(treck[index].name!),
                    subtitle: Text("🔥 ${nt!.calories} · 100G"),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NutritionScreen(food),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_circle_right_outlined)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
              )),
        ),
      ],
    );
  }

  Widget addFood(BuildContext context, TrecksProvider provider) {
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
          showImagePicker(context, provider);
        } else {
          print("no permission provided");
        }
      },
      child: const Text("+ Add Food"),
    );
  }

  void showImagePicker(BuildContext context, TrecksProvider provider) {
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
                          _imgFromCamera(provider);
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
                          _imgFromGallery(provider);
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

  _imgFromGallery(TrecksProvider provider) async {
    final user = FirebaseAuth.instance.currentUser!;
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        setState(() {
          imageFile = File(value.path);
        });
        String prediction = "noodles";
        provider.addTrecks(prediction, user);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NutritionScreen(prediction),
          ),
        );
      }
    });
  }

  _imgFromCamera(TrecksProvider provider) async {
    final user = FirebaseAuth.instance.currentUser!;
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        setState(() {
          imageFile = File(value.path);
        });
        String prediction = "chappati";
        provider.addTrecks(prediction, user);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NutritionScreen(prediction),
          ),
        );
      }
    });
  }
}
