

import 'package:flutter/material.dart';
import 'package:gomdong/constants/dummyData.dart';
import 'package:gomdong/models/chat_room_model.dart';


class ChatRoomPage extends StatelessWidget {
  final ChatRoomModel chatRoom;

  const ChatRoomPage({super.key, required this.chatRoom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatRoom.itemName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatRoom.messages.length,
              itemBuilder: (context, index) {
                final message = chatRoom.messages[chatRoom.messages.length - 1 - index];
                final isMe = message.senderId == DummyData.currentUserId; // Replace with actual user ID
                final currentMinute = message.timestamp.minute;

                final bool showAvatar = index == 0 ||
                    chatRoom.messages[chatRoom.messages.length - index].timestamp.minute != currentMinute;

                return Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe && showAvatar)
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[400],
                          child: Text(message.senderId[0].toUpperCase()), // Replace with actual avatar logic
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          isMe? Text(
                            "${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ) : Container(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.blueAccent : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(color: isMe ? Colors.white : Colors.black87),
                            ),
                          ),
                          isMe?
                          Container() :
                          Text(
                            "${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "메시지를 입력하세요...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // send logic here
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}