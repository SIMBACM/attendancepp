import 'package:all_project/Viewmodel/widgets/checkinandoutwidget.dart';
import 'package:flutter/material.dart';

class Onsite extends StatefulWidget {
   Onsite({super.key});

  @override
  State<Onsite> createState() => _OnsiteState();
}

class _OnsiteState extends State<Onsite> {
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
                "QR Verification",
                "Please capture your Qr",
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customQrimage("assets/18.jpg", "Take a photo", context, "assets/16.json")
          ],
        ),
      ),
    );
  }
}
