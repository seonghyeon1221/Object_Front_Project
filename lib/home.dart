import 'package:flutter/material.dart';
import 'package:object_food_suggestion_project/setting.dart';
import 'category_first.dart';
import 'fastfood.dart';
import 'mypage.dart';
import 'package:provider/provider.dart';
import 'dessert.dart';
import 'dart:math';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
      child: MaterialApp(
        home: MyApp(),
        routes: {
          '/password_change': (context) => PasswordChangePage(),
          '/allergies_edit': (context) => AllergiesEditPage(),
          '/category_selection': (context) => CategorySelectionPage(),
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1; // 바텀 네비게이션 바 기본 탭을 2번째로 변경

  final List<Widget> _pages = [
    MyInfoPage(),
    MyHomePage(),
    SettingPage(),
  ];

  void refresh(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          refresh(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'My page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}



class MyHomePage extends StatelessWidget {
  final List<String> foodItems = [
    '치킨', '피자', '햄버거', '샌드위치', '컵밥', '밥', '면', '떡', '고기', '디저트'
  ];

  String getRandomFoodItem() {
    final random = Random();
    final index = random.nextInt(foodItems.length);
    return foodItems[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인후한끼'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SquareButton(
                    buttonText: '카테고리',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategorySelectionPage()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 1.0),
                Expanded(
                  child: SquareButton(
                    buttonText: '패스트푸드',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCategorySelectionPage()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 1.0),
                Expanded(
                  child: SquareButton(
                    buttonText: '디저트',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DessertPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            LayerWidget(
              color: Colors.white,
              text: 'Layer 1 내용',
              onPressed: () {
                final String recommendedFood = getRandomFoodItem();
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('추천 음식: $recommendedFood'),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  SquareButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonSize = (screenWidth - 48.0) / 3;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: Colors.black),
        minimumSize: Size(buttonSize, buttonSize),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class LayerWidget extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  LayerWidget({
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: color,
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text('추천 음식 보기'),
        ),
      ),
    );
  }
}
