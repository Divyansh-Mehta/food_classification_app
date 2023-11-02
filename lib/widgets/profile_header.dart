import "package:flutter/material.dart";

// ignore: must_be_immutable
class ProfileHeader extends StatefulWidget {
  String? photoLink;
  String? name;
  // ignore: use_key_in_widget_constructors
  ProfileHeader(this.photoLink, this.name);
  @override
  // ignore: library_private_types_in_public_api
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(222, 230, 232, 1),
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(widget.photoLink!),
          ),
          Text(
            widget.name!,
            style: const TextStyle(
                color: Color.fromRGBO(50, 75, 80, 1), fontSize: 20),
          ),
        ],
      ),
    );
  }
}
