import 'package:flutter/material.dart';
import 'package:gomdong/pages/chat/ChatPage.dart';
import 'package:gomdong/pages/home/HomePage.dart';
import 'package:gomdong/pages/map/MapPage.dart';
import 'package:gomdong/pages/mypage/MyPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomdong',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          shadowColor: Colors.black,
          indicatorColor: Colors.transparent,
          indicatorShape: CircleBorder(),
          elevation: 10,
          backgroundColor: Colors.white,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.location_on),
              icon: Icon(Icons.location_on_outlined), // Use badge to add badges later on
              label: '지도',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.messenger),
              icon: Badge(label: Text('2'), child: Icon(Icons.messenger_outline_rounded)), // change text to number of chats the user has
              label: '채팅',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: '내 정보',
            ),
          ],
      ),
      backgroundColor: Colors.white,
      body: <Widget>[
        HomePage(),
        Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  "지도 페이지는 현재 준비 중입니다.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ChatPage(),
        MyPage(),
      ][currentPageIndex],
    );
  }
}
