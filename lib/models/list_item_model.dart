class ListingItemModel {
  final String itemId;
  final String title;
  final String desc;
  final String imageUrl;
  final DateTime createdAt;
  final int totalPrice;
  final int totalCount;
  final String unit;
  final int maxParticipants;
  final int currentParticipants;
  final List<String> currentParticipantIds;
  final DateTime deadline;
  final List<String> tags;
  final String creatorId;
  final String location;

  ListingItemModel({
    required this.itemId,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.createdAt,
    required this.totalPrice,
    required this.totalCount,
    required this.unit,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.currentParticipantIds,
    required this.deadline,
    required this.tags,
    required this.creatorId,
    required this.location,
  });

  factory ListingItemModel.fromJson(Map<String, dynamic> json) {
    return ListingItemModel(
      itemId: json['itemId'] ?? '',
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      totalPrice: json['totalPrice'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
      unit: json['unit'] ?? '',
      maxParticipants: json['maxParticipants'] ?? 0,
      currentParticipants: json['currentParticipants'] ?? 0,
      currentParticipantIds: List<String>.from(json['currentParticipantIds'] ?? []),
      deadline: DateTime.parse(json['deadline']),
      tags: List<String>.from(json['tags'] ?? []),
      creatorId: json['creatorId'] ?? '',
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'title': title,
      'desc': desc,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'totalPrice': totalPrice,
      'totalCount': totalCount,
      'unit': unit,
      'maxParticipants': maxParticipants,
      'currentParticipants': currentParticipants,
      'currentParticipantIds': currentParticipantIds,
      'deadline': deadline.toIso8601String(),
      'tags': tags,
      'creatorId': creatorId,
      'location': location,
    };
  }
}
