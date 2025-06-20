import 'package:all_project/Viewmodel/validators.dart';
import 'package:all_project/Viewmodel/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
   Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5, vertical: 120),
            child: Column(
              children: [
                customforgotpasswordtext("Forgot Password", "Enter your registered", "email address"),
                SizedBox(height: 20),
                customTextField(
                  title: "Email address",
                  controller: emailController,
                  validator: validateEmail,
                ),
                SizedBox(height: 20),
                customResetpasswordbutton(context, "Reset password",_formKey,emailController),
                SizedBox(height: 20),
                custombacktologintextbutton(context, "Back to login"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
