import "package:flutter/material.dart";
import "./profile_header.dart";

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileHeader(),
            // Container(
            //   alignment: Alignment.center,
            //   child: UserAccountsDrawerHeader(
            //     accountName: const Text("Divyansh Mehta"),
            //     accountEmail: const Text(""),
            //     currentAccountPicture:
            //         Image.network("https://picsum.photos/250?image=9"),
            //     decoration: const BoxDecoration(
            //       color: Color.fromRGBO(222, 230, 232, 1),
            //     ),
            //   ),
            // ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color:  Color.fromRGBO(50, 75, 80, 1),
              ),
              title: const Text("Profile"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.architecture,
                color:  Color.fromRGBO(50, 75, 80, 1),
              ),
              title: const Text("Goals"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color:  Color.fromRGBO(50, 75, 80, 1),
              ),
              title: const Text("About"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color:  Color.fromRGBO(50, 75, 80, 1),
              ),
              title: const Text("Log Out"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
