import 'package:flutter/material.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/component/my_iconbtn.dart';
import 'package:onboarding_screen/screen/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';

//ต้องมีการ if stateต่างๆ ต้องใช้ stateful แทน stateless

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key}); //add const ไปหลังจาก stateless=>stateful

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Text Editing Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signInWithEmailAndPassword() async {
    //เพิ่ม asyncด้วย!

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog("Login successfully!");
    } on FirebaseAuthException catch (e) {
      print(
          'Failed with error code: ${e.code} '); //ดูในdocumentเพิ่มเติมว่าerrorจะพ่นอะไรออกมา error305?
      print(e.message);
      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          //คำสั่งกระโดดไปอีกหน้า
                          builder: (context) => const ToDoListScreen()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Scaffoldคือหน้าที่มีNav Bar
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[400],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../../assets/images/crane_game_arm_yowai.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8.0),
            Text(
              "Claw Claze",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context)
                    .textTheme
                    .displayLarge, //จัดtextแบบใช้libraryเหมือน bootstrap tailwindcss
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.deepPurple[200],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            10, 20, 10, 20), //กำหนด padding แบบ manual
        child: Form(
          child: Column(
            //บน->ล่าง
            children: [
              // ลบ SizedBox ใช้ widget Spacer() ดีกว่า โดยใส่หัวท้ายเป็นการทำให้มันติดเหมือนfixตำแหน่ง
              // const SizedBox(
              //   height: 10,
              // ),
              const Spacer(), //หัว-ท้าย
              Text(
                "Hello, ready to get started?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Colors.deepPurple[400],
                ),
              ),
              Text(
                "\nPlease sign in with your email and password.\n",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //เรียกmy_textfield.dart มีการร้องขอ parameter จาก required this.???
              MyTextField(
                controller: emailController,
                hintText: "Enter your email.",
                obscureText: false,
                labelText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: "Enter your password.",
                obscureText: true,
                labelText: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  //Wrapด้วย Row แบบอัตโนมัติ
                  mainAxisAlignment: MainAxisAlignment.end, //ขวาสุด
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.deepPurple[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //เรียกmy_button.dart มีการร้องขอ parameter จาก required this.???
              MyButton(onTap: signInWithEmailAndPassword, hinText: 'Sign In'),
              const SizedBox(
                height: 30,
              ),
              Padding(
                //สำคัญมาก Wrap Row ด้วย Padding
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0), //จัดให้ห่างตามแนวนอน 25.0
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //listรายการในrowจากleft to right
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              15.0), //Wrap text ด้วย padding ซ้าย15 ขวา15สมมาตรทั้งสองฝั่ง
                      child: Text(
                        'Or continue with',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.deepPurple.shade800,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        //Wrap ด้วย Widget และ rename จาก Widget เป็น Expanded
                        thickness: 0.5,
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, //ข้อความอยู่ row ตรงกลาง
                children: [
                  MyIconButton(
                    imagPath: '../../assets/images/google_icon.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(imagPath: '../../assets/images/apple_icon.png'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    //ห่างแนวนอนไป 2
                    width: 2,
                  ),
                  // TextButton(onPressed: () {เขียนโค๊ดตรงนี้เพื่อกระโดดไปหน้าอื่น}, child: Text('Register now'))=> นี่เป็นพื้นฐาน
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register now.',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple[400],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(), //Widgetมหัศจรรย์
            ],
          ),
        ),
      ),
    );
  }
}
