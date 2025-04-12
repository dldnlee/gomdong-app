import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gomdong/components/listing/ListingItem.dart';
import 'package:gomdong/pages/create/CreateListingPage.dart';
import 'package:gomdong/pages/detail/DetailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Gomdong"),
            Text("노고산동2", style: TextStyle(fontSize: 15))
          ]
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHomeBanner(context),
            _buildCategories(context),
            Divider(),
            _buildListings(context)
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateListingPage()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add, color: Colors.white),
      )
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = ['채소', '과일', '정육', '음료', '기타'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 10,
        children: categories.map((category) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: Handle category tap
                },
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    _getCategoryIcon(category),
                    color: Color.fromRGBO(164, 180, 101, 1),
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text(category, style: TextStyle(fontSize: 12)),
            ],

          );
        }).toList(),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case '채소':
        return Icons.eco;
      case '과일':
        return Icons.apple;
      case '정육':
        return Icons.set_meal;
      case '음료':
        return Icons.local_drink;
      default:
        return Icons.category;
    }
  }

  Widget _buildListings(BuildContext context) {
    final dummyItems = [
      {
        "title": "감자 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 4,
        "currentParticipants": 3
      },
      {
        "title": "당근 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 2,
        "currentParticipants": 1
      },
      {
        "title": "소시지 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 4,
        "currentParticipants": 3
      },
      {
        "title": "소시지 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 4,
        "currentParticipants": 3
      },
      {
        "title": "소시지 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 4,
        "currentParticipants": 3
      },
      {
        "title": "소시지 같이 구매하실분",
        "desc": "12개에 2천원인데 혼자 사기에는 너무 많아요. 같이 구매하실분..",
        "timeLeft": "2일 후 마감",
        "maxParticipants": 4,
        "currentParticipants": 3
      },
    ];

    return Column(
      children: dummyItems.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  title: item["title"] as String,
                  description: item["desc"] as String,
                  timeLeft: item["timeLeft"] as String,
                  maxParticipants: item["maxParticipants"] as int,
                  currentParticipants: item["currentParticipants"] as int,
                ),
              ),
            );
          },
          child: ListingItem(
            title: item["title"] as String,
            description: item["desc"] as String,
            timeLeft: item["timeLeft"] as String,
            maxParticipants: item["maxParticipants"] as int,
            currentParticipants: item["currentParticipants"] as int,
          ),
        );
      }).toList(),
    );
  }


  Widget _buildHomeBanner(BuildContext context){
    final banners = [
      "banner_0","banner_1"
    ];
    return AspectRatio(
      aspectRatio: 2,
      child: (
        Swiper(
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banners/${banners[index]}.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            );
          },
          viewportFraction: .7,
          scale: 0.86,
        )
      ),
    );
  }

}
