# 🐻 곰동 (Gomdong) – 자취생을 위한 공동구매 플랫폼
<img src="https://github.com/user-attachments/assets/33d80617-c74f-4bb1-80ad-d36ea3b1dcef" width="200"/>

곰동은 자취생들이 쉽고 편리하게 공동구매를 통해 생활비를 절약하고 환경을 지킬 수 있도록 도와주는 모바일 앱입니다.  
귀여운 곰 마스코트와 함께라면, 소비도 같이 하면 더 즐거워져요!

![banner_0](https://github.com/user-attachments/assets/b6c9536f-30c0-4bd0-933d-8228f847e713)

---

## 🚀 주요 기능

- 📦 **공동구매 리스트**: 다양한 생필품 및 식료품의 공동구매 리스트를 확인하고 참여할 수 있어요.
- 🤝 **참여자 수 확인**: 모집 인원과 현재 참여자 수를 시각적으로 보여주는 진행 바 UI
- 🔍 **검색 및 필터링**: 원하는 품목을 카테고리/키워드로 빠르게 찾아요.
- 📝 **리스트 생성**: 직접 공동구매를 제안하고 다른 사람들과 함께 참여할 수 있어요.
- 🧾 **가격 비교 및 절약 분석**: 구매 시 개인이 절약한 금액과 환경 기여도를 한눈에!

---

## 📱 기술 스택

| 영역 | 기술 |
|------|------|
| 프론트엔드 | Flutter (Dart) |
| 백엔드 | Firebase (Authentication, Firestore, Cloud Functions) |
| 상태 관리 | Provider |
| 기타 | Firebase Storage, Google Maps API (예정) |

---

## 📁 프로젝트 구조

```bash
lib/
│
├── models/              # 데이터 모델 정의
├── pages/               # 주요 화면 (홈, 디테일, 생성 등)
├── components/          # 재사용 가능한 위젯들
├── services/            # Firebase 및 기타 API 서비스
├── dummyData/           # 테스트용 가상 데이터
└── main.dart            # 앱 진입점
