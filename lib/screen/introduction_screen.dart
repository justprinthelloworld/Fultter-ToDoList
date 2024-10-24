import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:onboarding_screen/screen/signin_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key}); //ขัดแย้งconst ให้ลบ const ทิ้ง

  final List<PageViewModel> pages = [
    PageViewModel(
      //Fix String กำหนดเป็น widget text กำหนด style ไม่ได้ ต้องมี title,body,footer
      title: 'Welcome to Claw Craze!',
      body:
          "🕹️ Get ready for a world of excitement and skill as you enter the realm of Claw Craze! Are you ready to test your precision and grab fantastic prizes with our thrilling crane claw machines? Let the fun begin as you embark on a claw-tastic adventure!",
      footer: SizedBox(
        // ใส่ constไม่ได้ errorปุ่ม
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
            //Widget ปุ่มกด
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: Text("Let's Get Started!",
          style: TextStyle(
            color: Colors.deepPurple[200],
          ),
          ),
        ),
      ),
      image: const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          '../../assets/images/happy_boy.png',
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB24D3E),
        ),
        pageColor: Color(0xFFF9705A),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black, // Change color as needed
        ),
      ),
    ),
    PageViewModel(
      title: 'Master the Claw Control',
      body:
          "🦀 Before you dive into the prize-filled world, master the art of controlling the claw. Use the joystick to navigate and position the claw above your desired prize. Once you've got the perfect aim, press the button to lower the claw and attempt to grab your prize. It's all about timing and skill – can you become the ultimate Claw Master and snag the coolest rewards?",
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: Text("Let's Get Started!",
          style: TextStyle(
            color: Colors.deepPurple[200],
          ),
          ),
        ),
      ),
      image: const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          '../../assets/images/crane_bear.png',
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB6616B),
        ),
        pageColor: Color(0xFFEE828F),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black, // Change color as needed
        ),
      ),
    ),
    PageViewModel(
      title: 'Collect and Conquer',
      body:
          "🎉 Now that you've honed your claw skills, it's time to collect amazing prizes! Navigate through a variety of claw machines, each filled with unique and exciting items. From toys to gadgets, the possibilities are endless. Rack up points, unlock new machines, and showcase your claw mastery. Are you ready to grab, collect, and win your way to the top of Claw Craze? Let the clawing adventure begin!",
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: Text("Let's Get Started!",
          style: TextStyle(
            color: Colors.deepPurple[200],
          ),
          ),
        ),
      ),
      image: const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage(
          '../../assets/images/crane_sad.png',
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA89D82),
        ),
        pageColor: Color(0xFFFFEEC8),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  ]; //เมื่อ run program

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text("Claw Claze",
                textAlign:TextAlign.center,
                style:GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
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

      body: IntroductionScreen(
        globalBackgroundColor: Colors.deepPurple[400],
        //ต้องการ list เราก็ให้ pages var ไป
        pages: pages,
        showSkipButton: true, //ปุ่มskip
        skip: Text('Skip',
          style: TextStyle(
            color: Colors.deepPurple[200],
          ),
        ),
        showDoneButton: true, //showปุ่มdoneเมื่อถึงหน้าสุดท้ายของlist pages var
        done: Text('Done',
          style: TextStyle(
            color: Colors.deepPurple[200],
          ),
        ),
        showNextButton: true, //ปุ่มnextมีicon หัวลูกศร
        next: Icon(
          Icons.arrow_forward,
          size: 25,
          color: Colors.deepPurple[200],
        ),
        onDone: () => onDone(context), //ถ้าหน้าสุดท้ายกระโดดไปหน้า home_screen OnDone properties ต้องการ function onDone ซึ่งต้องไปสร้างเองก่อน โดยสร้างอยู่ในclassแต่นอกWidget
        curve: Curves.bounceOut,
        dotsDecorator: DotsDecorator(
          size: const Size(15, 15),
          color: Colors.grey.shade300,
          activeColor: Colors.grey.shade400, //หน้าที่ใช้อยู่
          activeSize: const Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          //ใน flutterหน้าจะเป็นstackต้องออกถึงหน้าที่pushเข้าไป
          builder: (context) => SignInScreen()),
    );
  }
}
