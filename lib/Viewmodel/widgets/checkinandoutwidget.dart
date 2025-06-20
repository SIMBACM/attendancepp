import 'package:all_project/view/camera.dart';
import 'package:all_project/view/cameracheckout.dart';
import 'package:all_project/view/cameraqr.dart';
import 'package:all_project/view/checkin.dart';
import 'package:all_project/view/checkinonsite.dart';
import 'package:all_project/view/checkout.dart';
import 'package:all_project/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

Widget appBarHeading(String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(subtitle, style: TextStyle(color: Colors.black87, fontSize: 14)),
    ],
  );
}

Widget customcheckoutimageandbutton(
  String assetPath,
  String title,
  BuildContext context,
  String animeasset,
) {
  return Column(
    children: [
      SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10.0),
              child: Image.asset(assetPath, fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Lottie.asset(
                animeasset, // Path to your Lottie animation file
                repeat: true,
                animate: true,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cameracheckout()),
          );
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget customcheckinimageandbutton(
  String assetPath,
  String title,
  BuildContext context,
  String animeasset,
) {
  return Column(
    children: [
      SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10.0),
              child: Image.asset(assetPath, fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Lottie.asset(
                animeasset, // Path to your Lottie animation file
                repeat: true,
                animate: true,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Camera()),
          );
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget customQrimage(
  String assetPath,
  String title,
  BuildContext context,
  String animeasset,
) {
  return Column(
    children: [
      SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10.0),
              child: Image.asset(assetPath, fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: Lottie.asset(
                animeasset, // Path to your Lottie animation file
                repeat: true,
                animate: true,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cameraqr()),
          );
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget cameraheading(String title, String subtitle, String subtitle2) {
  return Center(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 16)),
        Text(subtitle2, style: TextStyle(color: Colors.black, fontSize: 16)),
      ],
    ),
  );
}
// Update with your actual import

Widget customIconbutton(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white, Color.fromARGB(255, 135, 174, 242)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 80),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 234, 230, 230),
          minRadius: 15,
          child: IconButton(
            icon: Icon(Icons.cameraswitch, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 30),
        IconButton(
          icon: Icon(Icons.check_circle, color: Colors.blue, size: 80),
          onPressed: () {
            final now = DateTime.now();
            final formattedTime = DateFormat('hh:mm a').format(now);
            final message = "You are Punched-in at $formattedTime";
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Dashboard(
                            checkinMessage: message,
                            checkoutMessage: "",
                          ),
                    ),
                  );
                });

                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color(0xFF69E76D),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Color.fromARGB(255, 25, 216, 89),
                            size: 100,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Punched in at $formattedTime',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(width: 30),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 234, 230, 230),
          minRadius: 15,
          child: IconButton(
            icon: Icon(Icons.flash_on, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

Widget customchekout(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white, Color.fromARGB(255, 135, 174, 242)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 80),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 234, 230, 230),
          minRadius: 15,
          child: IconButton(
            icon: Icon(Icons.cameraswitch, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 30),
        IconButton(
          icon: Icon(Icons.check_circle, color: Colors.blue, size: 80),
          onPressed: () {
            final now = DateTime.now();
            final formattedTime = DateFormat('hh:mm a').format(now);
            final message = "You are Punched-out at $formattedTime";
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                // Delay before navigating
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Dashboard(
                            checkinMessage: "",
                            checkoutMessage: message,
                          ),
                    ),
                  );
                });

                // Dialog UI
                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 227, 203, 162), // Light green
                          Color.fromARGB(255, 216, 126, 29), // Deeper green
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 100,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Punched out Successfully at $formattedTime',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(width: 30),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 234, 230, 230),
          minRadius: 15,
          child: IconButton(
            icon: Icon(Icons.flash_on, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

/// Widget: Check-in / Check-out container
Widget checkinandoutwidget(
  String title,
  String subtile,
  String subtitle2,
  BuildContext context,
  String title2,
  String title3,
  String title4,
) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Check-in status text
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 29, 251, 0),
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8),

        // Punch clock row
        Row(
          children: [
            Icon(Icons.punch_clock, color: Colors.amber),
            SizedBox(width: 10),
            Text(subtile, style: TextStyle(color: Colors.amber)),
          ],
        ),

        SizedBox(height: 8),

        // Location row
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.red),
            SizedBox(width: 10),
            Text(subtitle2),
          ],
        ),

        SizedBox(height: 20),

        // Buttons row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(218, 154, 154, 154),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.orange,
                            size: 40,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Do you really want\nto checkin!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Update Task Button
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // or handle update task
                                },
                                child: Text(
                                  'On site',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              // Check Out Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(); // close dialog
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Checkin(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Work form home',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.check_circle_outline, color: Colors.white),
              label: Text(
                title4,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(218, 154, 154, 154),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.orange,
                            size: 40,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Do you really want\nto checkout!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Update Task Button
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); //  handle update task
                                },
                                child: Text(
                                  'Update Task',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              // Check Out Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(); // close dialog
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Checkout(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Check Out',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.exit_to_app_rounded, color: Colors.white),
              label: Text(
                title3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget customCheckinDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select Punch - In Type',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(height: 20),
        Text(
          'Are you working from home or onsite \ntoday?',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onsite()),
                );
              },
              child: Text(
                'On site',
                style: TextStyle(
                  fontSize: 13,
                  color:  Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkin()),
                );
              },
              child: Text(
                'Work from home',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget customCheckoutDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 40),
        SizedBox(height: 12),
        Text(
          'Do you really want\nto punchout!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Update Task Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Update Task',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Check Out Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkout()),
                );
              },
              child: Text(
                'Check Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
