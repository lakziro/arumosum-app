import 'package:arumosum/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:arumosum/components/colors.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: gray,
      child: Column(
        children: <Widget>[
          InkWell(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                );
              },
              leading: Icon(Icons.perm_identity),
              title: Text("Log In"),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
