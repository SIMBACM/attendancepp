import 'package:all_project/Viewmodel/validators.dart';
import 'package:all_project/Viewmodel/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
   const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  horizontal: 24,
                  vertical: 120,
                ),
                child: Column(
                  children: [
                    heading("ZiyaAttend", "Create an account"),
                    SizedBox(height: 10),
                    customTextField(
                      title: "Name",
                      controller: nameController,
                      validator: validateName,
                    ),
                    SizedBox(height: 10),
                    customTextField(
                      title: "Phone number",
                      controller: phoneController,
                      validator: validatephonenumber,
                    ),
                    SizedBox(height: 10),
                    customTextField(
                      title: "Email",
                      controller: emailController,
                      validator: validateEmail,
                    ),
                    SizedBox(height: 10),
                    customTextField(
                      title: "Password",
                      controller: passwordcontroller,
                      validator: validatepassword,
                      obscuretext: true,
                    ),
                    SizedBox(height: 10),
                    customTextField(
                      title: "Confirm password",
                      controller: confirmpasswordcontroller,
                      obscuretext: true,
                      validator:
                          (value) => validateConfirmpassword(
                            value,
                            passwordcontroller.text,
                          ),
                    ),
                    SizedBox(height: 10),
                    customSignup(
                      context,
                      "Signup",
                      _formKey,
                      nameController,
                      emailController,
                      phoneController,
                      passwordcontroller,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 70),
                        customTextButton(context, "Login"),
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
