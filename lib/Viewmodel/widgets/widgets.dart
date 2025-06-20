import 'package:all_project/Viewmodel/services.dart';
import 'package:all_project/view/dashboard.dart';
import 'package:all_project/view/forgotpassword.dart';
import 'package:all_project/view/log_in.dart';
import 'package:flutter/material.dart';


/// ------------------------------
/// Background Pattern Top-Left Curve (Green + Blue layered)
/// ------------------------------
Widget pattern() {
  return Stack(
    children: [
      Positioned(
        top: -100,
        left: -10,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(350)),
          ),
        ),
      ),
      Positioned(
        top: -80,
        left: -50,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(350)),
          ),
        ),
      ),
    ],
  );
}


/// ------------------------------
/// Background Pattern Bottom-Right Curve (Green + Light Green layered)
/// ------------------------------
Widget pattern2() {
  return Stack(
    children: [
      Positioned(
        bottom: -220,
        right: 20,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color:  Color.fromARGB(243, 3, 122, 41),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(350)),
          ),
        ),
      ),
      Positioned(
        bottom: -210,
        right: -10,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color:  Color.fromARGB(255, 122, 234, 47),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(350)),
          ),
        ),
      ),
    ],
  );
}



/// ------------------------------
/// Heading Widget: Title + Subtitle text block
/// SignUp Page and Loginpage
/// ------------------------------
Widget heading(final String title, final String subtile) {
  return Padding(
    padding: EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                subtile,
                style: TextStyle(fontSize: 22, color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



/// ------------------------------
/// Custom TextField with dynamic label
/// ------------------------------
Widget customTextField({
  required String title,
  required TextEditingController controller,
  required String? Function(String?) validator,
  bool obscuretext = false,
}) {
  return SizedBox(
    width: 300,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: validator,
      obscureText: obscuretext,
    ),
  );
}

/// ------------------------------
/// Custom Elevated Button for Signup
/// ------------------------------
Widget customSignup(
  BuildContext context,
  String title,
  GlobalKey<FormState> _formKey,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  TextEditingController passwordController,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize:  Size(300, 60),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    onPressed: () async {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar( SnackBar(content: Text("Signup Successfully")));
        await signUpUser(
          nameController.text.trim(),
          emailController.text.trim(),
          phoneController.text.trim(),
          passwordController.text.trim(),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
      }
      // TODO: Add Signup action
    },
    child: Text(
      title,
      style:  TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

/// ------------------------------
/// Text Button used for Login redirection
/// ------------------------------
Widget customTextButton(BuildContext context, String title) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Login()),
      );
    },
    child: Text(
      title,
      style: TextStyle(
        color:  Color.fromARGB(255, 1, 255, 1),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}


/// ------------------------------
/// Custom Login Button (full width)
/// ------------------------------
Widget customLoginButton(
  BuildContext context,
  String title,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize:  Size(300, 60),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: () async {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        final success = await loginUser(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (success) {
          final message = "You haven't checked in yet";

          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Login successful")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                checkoutMessage: message,
                checkinMessage: "",
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Login failed. Please check credentials.")),
          );
        }
      }
    },
    child: Text(
      title,
      style:  TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

/// ------------------------------
/// Text Button for Forgot Password
/// ------------------------------
Widget customforgotpasswordbutton(BuildContext context, String title) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 20),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Forgotpassword()),
      );
      // TODO: Forgot password navigation
    },
    child: Text(
      title,
      style: TextStyle(color:  Color.fromARGB(255, 0, 0, 0), fontSize: 17),
    ),
  );
}

/// ------------------------------
/// Text Button for Signup (used on Login screen)
/// ------------------------------
Widget signuptextbutton(BuildContext context, String title) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
    onPressed: () {
      Navigator.pop(context);
      // TODO: Signup navigation
    },
    child: Text(
      title,
      style: TextStyle(
        color:  Color.fromARGB(255, 0, 253, 63),
        fontSize: 17,
      ),
    ),
  );
}


/// Forgot password text
/// (title+subtitle)///


Widget customforgotpasswordtext(String title, String subtile, String subtitle2) {
  return Padding(
    padding:  EdgeInsets.all(32),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color:  Color.fromARGB(255, 75, 51, 181),
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtile,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle2,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

/// A custom ElevatedButton widget to trigger password reset functionality.
Widget customResetpasswordbutton(
  BuildContext context,
  String title,
  GlobalKey<FormState> _formKey,
  TextEditingController emailController,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(300, 60), // Set the button size
      backgroundColor: Colors.blue, // Set the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
    ),
    onPressed: () async {
      final form = _formKey.currentState;

      // Validate form before proceeding
      if (form != null && form.validate()) {
        // Show confirmation snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Reset Password link sent successfully")),
        );

        // Call resetPassword function with trimmed email
        await resetPassword(emailController.text.trim());
      }

      // TODO: Add login redirection logic after password reset
    },
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

/// A custom TextButton widget that navigates back to the login screen.
Widget custombacktologintextbutton(BuildContext context, String title) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent, // No background color
      side: BorderSide.none, // No border
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      shadowColor: Colors.transparent, // No shadow
      elevation: 0, // No elevation
    ),
    onPressed: () {
      Navigator.pop(context); // Navigate back to the previous screen

      // TODO: Optionally replace with named route or additional logic
    },
    child: Text(
      title,
      style: TextStyle(color:  Color.fromARGB(255, 0, 0, 0), fontSize: 23),
    ),
  );
}
