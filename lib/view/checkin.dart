import 'package:all_project/Viewmodel/widgets/checkinandoutwidget.dart';
import 'package:flutter/material.dart';

class Checkin extends StatefulWidget {
   Checkin({super.key});

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(175),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          automaticallyImplyLeading: false,
          toolbarHeight: 160,
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:  EdgeInsets.only(top: 100),
              child: appBarHeading(
                "Face Verification",
                "Please capture your face",
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customcheckinimageandbutton(
              "assets/14.png",
              "Take a photo",
              context,
              "assets/16.json",
            ),
          ],
        ),
      ),
    );
  }
}
