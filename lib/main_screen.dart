import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toktokcat/custom_icons.dart';

// 아이콘 사용
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();
  bool isEditMode = false; // 수정 모드인지 여부

  @override
  void initState() {
    super.initState();
    // getIntroduceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.blueGrey),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Text(
          '연애 고민은 톡톡캣',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("당신의 고민을 말해보라냥~😽",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: TextField(
              controller: introduceController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: '어떤 남자애가 초콜릿을 줬는데 이거 호감이야?',
                hintStyle:
                    const TextStyle(color: Colors.blueGrey, fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          // 종이비행기 아이콘 버튼
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            alignment: Alignment.topRight,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/chat',
                    arguments: introduceController.text);
              },
              icon: const Icon(MyFlutterApp.paper_plane),
              label: const Text('보내기'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
