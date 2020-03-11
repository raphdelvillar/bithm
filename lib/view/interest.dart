import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            labelText: "Amount",
            hintText: "Amount",
          ),
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            labelText: "Interest",
            hintText: "Interest",
          ),
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            labelText: "Day/s",
            hintText: "Day/s",
          ),
        )
      )
    ]);
  }
}