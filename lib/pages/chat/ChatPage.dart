import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅방"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        // padding: const EdgeInsets.all(16),
        itemCount: 10, // 예시 채팅방 수
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text("A${index + 1}"),
            ),
            title: Text("채팅방 ${index + 1}"),
            subtitle: Text("마지막 메시지 내용이 여기에 표시됩니다."),
            trailing: Text("오전 10:${(index + 1) * 2}"),
            onTap: () {
              // 추후 개별 채팅방으로 이동하는 네비게이션 처리
            },
          );
        },
      ),
    );
  }
}
