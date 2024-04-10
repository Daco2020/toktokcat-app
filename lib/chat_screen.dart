import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  final String question;

  const ChatScreen({super.key, required this.question});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String answer = '';

  @override
  void initState() {
    super.initState();
    sendQeustionToServer(widget.question);
  }

  Future<void> sendQeustionToServer(String question) async {
    const String apiUrl = '';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'questions': [
            '고민 내용: ${question}. 4문장 이내로 짧게 반말로 답변해주고, 모든 문장 끝에는 \'냥\'을 붙여줘'
          ],
          'answers': [],
        }),
      );

      if (response.statusCode == 200) {
        // 서버로부터의 응답 처리
        print('서버 응답: ${response.body}');
        final Map<String, dynamic> data = json.decode(response.body);
        final String serverAnswer = data['answer'];
        setState(() {
          answer = serverAnswer;
        });
      } else {
        // 서버로부터의 응답 에러 처리
        print('서버 응답 에러: ${response.statusCode}');
      }
    } catch (e) {
      // 네트워크 에러 처리
      print('요청 중 에러 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('질문: ${widget.question}',
                  style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              Text('답변: $answer', style: const TextStyle(fontSize: 30)),
              // 답변을 출력할 부분
            ],
          ),
        ),
      ),
    );
  }
}
