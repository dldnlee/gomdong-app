import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomdong/constants/dummyData.dart';
import 'package:gomdong/pages/chat/ChatRoomPage.dart';

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
        itemCount: DummyData.dummyChatRooms.length,
        itemBuilder: (context, index) {
          final room = DummyData.dummyChatRooms[index];
          final lastMessage = room.messages.isNotEmpty
              ? room.messages.last.content
              : "메시지가 없습니다.";
          final lastTime = room.messages.isNotEmpty
              ? TimeOfDay.fromDateTime(room.messages.last.timestamp)
              : null;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoomPage(chatRoom: room),
                ),
              );
            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(room.itemImageUrl),
                backgroundColor: Colors.grey[300],
              ),
              title: Text(room.itemName),
              subtitle: Text(lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: lastTime != null
                  ? Text("${lastTime.hour}:${lastTime.minute.toString().padLeft(2, '0')}")
                  : null,
            ),
          );
        },
      ),
    );
  }
}
