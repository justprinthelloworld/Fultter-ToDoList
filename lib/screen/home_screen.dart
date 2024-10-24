import 'package:flutter/material.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signInWithEmail() {}

  @override
  Widget build(BuildContext context) {
    //Scaffoldคือหน้าที่มีNav Bar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Program'), //ใส่ const ด้วย
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //เรียกmy_textfield.dart มีการร้องขอ parameter จาก required this.???
            MyTextField(
              controller: emailController,
              hintText: "Enter your email",
              obscureText: false,
              labelText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: passwordController,
              hintText: "Enter your password",
              obscureText: true,
              labelText: "Password",
            ),
            const SizedBox(
              height: 30,
            ),
            //เรียกmy_button.dart มีการร้องขอ parameter จาก required this.???
            MyButton(onTap: signInWithEmail, hinText: 'Sign In')
          ],
        ),
      ),
    );
  }
}
