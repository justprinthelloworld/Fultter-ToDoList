import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:onboarding_screen/screen/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';//packageเก็บไว้ใน mobile memory

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool show = true;//ใช้ global var(ทุกclassเรียกได้)ใช้ในการเปิดปิด onboarding_screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(//รอให้ firebaseเริ่มทำงาน
    options:DefaultFirebaseOptions.currentPlatform, //android ios website id มีต่างกัน
  );

  final prefs = await SharedPreferences.getInstance(); //final runtimeหรือcompile time prefsให้สร้างข้อมูล เข้าถึงข้อมูลในเครื่อง memory คล้าย session โดยเก็บ ON_BOARDING
  show = prefs.getBool('ON_BOARDING') ?? true; //ถ้ายังไม่หน้าสุดท้าย ON_BOARDING อ้างถึง
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: IntroScreen(),//runหน้าแรก ใส่ constหลังจาก import home_screen.dart
      home: show ? IntroScreen() : SignInScreen() , // short func() ของ if() else() โดย ถ้า show เป็น true ให้กระโดดไปหน้า introduction screen แต่ถ้า กด done ก็ else ไป home screen
    );
  }
}