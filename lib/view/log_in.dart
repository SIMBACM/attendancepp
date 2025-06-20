import 'package:all_project/Viewmodel/validators.dart';
import 'package:all_project/Viewmodel/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   Login({super.key});
  

  @override
  
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailandphoneController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Stack(
          children: [
            pattern(),
            pattern2(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 120,
                ),
                child: Column(
                  children: [
                    heading("ZiyaAttend", "Smart Attendance Maintainer"),
                    SizedBox(height: 90),
                    customTextField(title: "Email or Mobile number",
                    controller: emailandphoneController,
                    validator: validateEmailOrPhone,
                    ),
                    SizedBox(height: 10),
                    customTextField(title: "Password/OTP",
                    controller: passwordController,
                    validator: validatepassword,
                    obscuretext: true,
                    ),
                    SizedBox(height: 10),
                    customLoginButton(context, "Login",_formKey,emailandphoneController,passwordController),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customforgotpasswordbutton(context, "Forgot password"),
                        SizedBox(width: 100),
                        signuptextbutton(context, "Signup",),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
