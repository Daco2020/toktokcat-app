import 'package:flutter/material.dart';

// 시작 화면
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/toktokcat.jpg', width: 200),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text("연애 고민은 톡톡캣",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
            ),
          ],
        ),
      ),
    );
  }
}
