import '../models/chat_room_model.dart';

class DummyData {
  static const listingDummyItems = [
    {
      "itemId": "item001",
      "title": "계란 30개 묶음 같이 살 분",
      "desc": "대형마트에서 30개 한 묶음으로만 팔아서 같이 사요!",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-16T09:00:00Z",
      "totalPrice": 5400,
      "totalCount": 30,
      "unit": "개",
      "maxParticipants": 3,
      "currentParticipants": 2,
      "currentParticipantIds": ["uid001", "uid002"],
      "deadline": "2025-04-18T23:00:00Z",
      "tags": ["식품", "계란", "마트공동구매"],
      "creatorId": "user_egglover",
      "location": "서울 강서구"
    },
    {
      "itemId": "item002",
      "title": "친환경 키친타올 6롤 공동구매",
      "desc": "환경을 생각해서 생분해 키친타올 같이 사요!",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-15T11:30:00Z",
      "totalPrice": 8900,
      "totalCount": 6,
      "unit": "롤",
      "maxParticipants": 4,
      "currentParticipants": 3,
      "currentParticipantIds": ["uid003", "uid004", "uid005"],
      "deadline": "2025-04-19T18:00:00Z",
      "tags": ["생필품", "친환경", "공동구매"],
      "creatorId": "user_greener",
      "location": "서울 종로구"
    },
    {
      "itemId": "item003",
      "title": "고급 원두커피 1kg 나눠서 사요",
      "desc": "혼자 다 못 마셔요! 커알못분들 환영 ☕️",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-14T13:45:00Z",
      "totalPrice": 15800,
      "totalCount": 1000,
      "unit": "g",
      "maxParticipants": 5,
      "currentParticipants": 4,
      "currentParticipantIds": ["uid006", "uid007", "uid008", "uid009"],
      "deadline": "2025-04-20T15:00:00Z",
      "tags": ["식품", "커피", "취향저격"],
      "creatorId": "user_barista",
      "location": "서울 관악구"
    },
    {
      "itemId": "item004",
      "title": "라면 박스 (20봉) 같이 구매할 사람?",
      "desc": "한 박스는 너무 많아서 나눠 사요!",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-13T16:00:00Z",
      "totalPrice": 12400,
      "totalCount": 20,
      "unit": "봉",
      "maxParticipants": 4,
      "currentParticipants": 1,
      "currentParticipantIds": ["uid010"],
      "deadline": "2025-04-18T22:00:00Z",
      "tags": ["식품", "라면", "자취생"],
      "creatorId": "user_noodle",
      "location": "서울 성북구"
    },
    {
      "itemId": "item005",
      "title": "샴푸 대용량 2L 나눠써요",
      "desc": "헤어살롱용 대용량 샴푸 저렴하게 나눠요.",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-12T17:20:00Z",
      "totalPrice": 9700,
      "totalCount": 2000,
      "unit": "ml",
      "maxParticipants": 3,
      "currentParticipants": 3,
      "currentParticipantIds": ["uid011", "uid012", "uid013"],
      "deadline": "2025-04-17T21:00:00Z",
      "tags": ["생필품", "뷰티", "공구"],
      "creatorId": "user_beauty",
      "location": "서울 동대문구"
    },
    {
      "itemId": "item006",
      "title": "마스크팩 10장 세트 같이 사요",
      "desc": "1장에 천 원도 안되는 가격, 10장은 너무 많아요~",
      "imageUrl": "https://via.placeholder.com/150",
      "createdAt": "2025-04-11T10:10:00Z",
      "totalPrice": 8900,
      "totalCount": 10,
      "unit": "장",
      "maxParticipants": 5,
      "currentParticipants": 2,
      "currentParticipantIds": ["uid014", "uid015"],
      "deadline": "2025-04-16T20:00:00Z",
      "tags": ["뷰티", "마스크팩", "저렴이템"],
      "creatorId": "user_masker",
      "location": "서울 마포구"
    }
  ];

  static const currentUserId = "user_001";


  static final List<ChatRoomModel> dummyChatRooms = [
    ChatRoomModel(
      id: "room_001",
      itemId: "item_001",
      itemName: "친환경 키친타올 6롤",
      itemImageUrl: "https://via.placeholder.com/150",
      maxParticipants: 4,
      participantIds: ["user_001", "user_002", "user_003"],
      messages: [
        MessageModel(
          senderId: "user_001",
          content: "이거 언제 주문 들어가요?",
          timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        ),
        MessageModel(
          senderId: "user_002",
          content: "3명 모이면 바로 결제할게요!",
          timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      closedAt: null,
      authorId: "user_001"
    ),
    ChatRoomModel(
      id: "room_002",
      itemId: "item_002",
      itemName: "고급 원두커피 1kg",
      itemImageUrl: "https://via.placeholder.com/150",
      maxParticipants: 5,
      participantIds: ["user_003", "user_004", "user_005", "user_006"],
      messages: [
        MessageModel(
          senderId: "user_004",
          content: "커피 너무 좋아요 ㅋㅋ",
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        MessageModel(
          senderId: "user_006",
          content: "같이 사서 싸게 마시자~",
          timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      closedAt: null,
      authorId: "user_001"
    ),
    ChatRoomModel(
      id: "room_003",
      itemId: "item_003",
      itemName: "라면 박스 (20봉)",
      itemImageUrl: "https://via.placeholder.com/150",
      maxParticipants: 4,
      participantIds: ["user_007"],
      messages: [
        MessageModel(
          senderId: "user_007",
          content: "라면 좋아하는 사람~",
          timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      closedAt: null,
      authorId: "user_001"
    ),
  ];
}
