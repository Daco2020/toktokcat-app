import 'package:toktokcat/chat_screen.dart';
import 'package:toktokcat/splash_screen.dart';
import 'package:toktokcat/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'toktokcat',
      debugShowCheckedModeBanner: false, // 디버그 라벨 제거
      initialRoute: '/', // 초기 경로
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainScreen(),
        '/chat': (context) {
          // RouteSettings에서 arguments를 추출해
          final args = ModalRoute.of(context)!.settings.arguments as String;
          // ChatScreen에 arguments를 전달하면서 화면을 구성해
          return ChatScreen(question: args);
        },
      },
    );
  }
}
