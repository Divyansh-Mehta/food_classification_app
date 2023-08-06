import "package:flutter/material.dart";

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(222, 230, 232, 1),
      width: double.infinity,
      height: 180,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/app_drawer.png'),
              ),
            ),
          ),
          Text(
            "Divyansh Mehta",
            style: TextStyle(
                color: const Color.fromRGBO(50, 75, 80, 1), fontSize: 20),
          ),
        ],
      ),
    );
  }
}
