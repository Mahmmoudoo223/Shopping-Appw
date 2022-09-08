import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({Key key}) : super(key: key);

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: AssetImage("assets/profile.jpg"))),
          ),
          Text(
            "Eng Youseef",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Eng Youseef@gmail.com",
            style: TextStyle(color: Colors.grey.shade200, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
