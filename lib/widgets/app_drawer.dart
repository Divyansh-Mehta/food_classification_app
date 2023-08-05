import "package:flutter/material.dart";

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Container(
      child: Column(
        children: <Widget>[
          // ProfileHeader(),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: const Text("Profile"),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.list_alt_sharp,
            ),
            title: const Text("Wish List"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.room_outlined,
            ),
            title: const Text("My Trips"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.confirmation_num,
            ),
            title: const Text("Rewards"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info_outline,
            ),
            title: const Text("About"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: const Text("Log Out"),
            onTap: () {},
          ),
        ],
      ),
    )));
  }
}
