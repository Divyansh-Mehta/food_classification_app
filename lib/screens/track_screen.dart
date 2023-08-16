import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class TrackScreen extends StatefulWidget {
  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              child: Card(

                margin: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1,
                // margin: EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(DateFormat.yMMMMd().format(DateTime.now())),
                    const Text("Today"),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
