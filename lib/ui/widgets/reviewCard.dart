
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reviewsCard extends StatelessWidget {
  const reviewsCard({
    super.key, required this.userName, required this.Description,
  });

  final String userName;
  final String Description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                userName,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                  Description,
                style: TextStyle(fontSize: 13),
              ),
            ),
          )),
    );
  }
}
