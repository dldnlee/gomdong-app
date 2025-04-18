class ChatRoomModel {
  final String id;
  final String itemId;
  final String itemName;
  final String itemImageUrl;
  final int maxParticipants;
  final List<String> participantIds;
  final List<MessageModel> messages;
  final DateTime createdAt;
  final DateTime? closedAt;
  final String authorId;

  ChatRoomModel({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.itemImageUrl,
    required this.maxParticipants,
    required this.participantIds,
    required this.messages,
    required this.createdAt,
    this.closedAt,
    required this.authorId,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'],
      itemId: json['itemId'],
      itemName: json['itemName'],
      itemImageUrl: json['itemImageUrl'],
      maxParticipants: json['maxParticipants'],
      participantIds: List<String>.from(json['participantIds']),
      messages: (json['messages'] as List<dynamic>)
          .map((msg) => MessageModel.fromJson(msg))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      closedAt: json['closedAt'] != null
          ? DateTime.parse(json['closedAt'])
          : null,
      authorId: json['authorId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'itemImageUrl': itemImageUrl,
      'maxParticipants': maxParticipants,
      'participantIds': participantIds,
      'messages': messages.map((m) => m.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'closedAt': closedAt?.toIso8601String(),
      'authorId': authorId,
    };
  }
}

class MessageModel {
  final String senderId;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
    'senderId': senderId,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
  };
}