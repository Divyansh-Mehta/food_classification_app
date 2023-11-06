import "package:flutter/material.dart";
import "package:food_classification_app/providers/google_sign_in.dart";
import "package:food_classification_app/screens/profile_screen.dart";
import "./profile_header.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:provider/provider.dart";
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class AppDrawer extends StatefulWidget {
  VoidCallback? erase;

  // ignore: use_key_in_widget_constructors
  AppDrawer(this.erase);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _saving = false;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              ProfileHeader(user.photoURL!, user.displayName!),
              // Container(
              //   child: UserAccountsDrawerHeader(
              //     accountName: Text(user.displayName!),
              //     accountEmail: Text(user.email!),
              //     currentAccountPicture:
              //         Image.network(user.photoURL!),
              //     decoration: const BoxDecoration(
              //       color: Color.fromRGBO(222, 230, 232, 1),
              //     ),
              //   ),
              // ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Color.fromRGBO(50, 75, 80, 1),
                ),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.architecture,
                  color: Color.fromRGBO(50, 75, 80, 1),
                ),
                title: const Text("Goals"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(50, 75, 80, 1),
                ),
                title: const Text("About"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color.fromRGBO(50, 75, 80, 1),
                ),
                title: const Text("Log Out"),
                onTap: () {
                  widget.erase!();
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                  setState(() {
                    _saving = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
