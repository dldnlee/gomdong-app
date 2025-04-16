import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gomdong/constants/dummyData.dart';
import 'package:gomdong/pages/create/CreateListingPage.dart';
import 'package:gomdong/pages/search/SearchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        title: Row(
          children: [
            Image.asset("assets/icons/gomdong_text_logo.png", height: 100, fit: BoxFit.contain,),
            Spacer(),
            Text("노고산동2", style: TextStyle(fontSize: 15)),
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHomeBanner(context),
            _buildCategories(context),
            _buildHomeAdBanner(context),
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
    final categories = ['재료', '생필품', '간식', '배달', '기타'];

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
                  backgroundColor: Colors.transparent,
                  child: _getCategoryIcon(category),
                ),
              ),
              SizedBox(height: 6),
              Text(category, style: TextStyle(fontSize: 13)),
            ],

          );
        }).toList(),
      ),
    );
  }

  Widget _getCategoryIcon(String category) {
    String assetName;
    switch (category) {
      case '재료':
        assetName = 'assets/icons/ingredients.png';
        break;
      case '생필품':
        assetName = 'assets/icons/necessities.png';
        break;
      case '간식':
        assetName = 'assets/icons/snacks.png';
        break;
      case '배달':
        assetName = 'assets/icons/delivery.png';
        break;
      default:
        assetName = 'assets/icons/others.png';
        break;
    }

    return Image.asset(
      assetName,
      width: 45,
      height: 45,
    );
  }

  Widget _buildListings(BuildContext context) {
    final dummyItems = DummyData.listingDummyItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("지금 곰동하기", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text("더보기"),
                  ),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios_outlined, size: 12,)
                ],
              )
            ],
          ),
        ),
        Column(
          children: dummyItems.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.image, color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["title"] as String, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("수량: 12개"),
                              Text("총 가격: 2,000원"),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 신청하기 액션
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                          child: Text("신청하기"),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (item["currentParticipants"] as int) / (item["maxParticipants"] as int),
                            backgroundColor: Colors.grey.shade200,
                            color: Colors.green.shade700,
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text("${item["currentParticipants"]}/${item["maxParticipants"]}", style: TextStyle(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildHomeAdBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, ),
      child: (
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10)
          ),
        )
      ),
    );
  }


  Widget _buildHomeBanner(BuildContext context){
    final banners = [
      "banner_0","banner_1"
    ];
    return AspectRatio(
      aspectRatio: 2.5,
      child: (
        Swiper(
          itemCount: banners.length,
          autoplay: true,
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
          viewportFraction: .9,
          scale: 0.80,
        )
      ),
    );
  }

}
