import 'package:flutter/material.dart';

import 'CreateProfile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: button());
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tap to button to add profile data",
            style: TextStyle(color: Colors.deepOrange, fontSize: 18),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateProfile()))
            },
            child: Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Add Profile",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
