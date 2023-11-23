import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('음식점 추천'),
      ),
      body: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, row) {
        return Column(
          children: [
            Card(
              margin: EdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  print('탭한 행: $row');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itemList[row].asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '    $item',
                            style: TextStyle(
                              fontSize: index == 0 ? 16 : 14,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

List<List<String>> itemList = [
  ['음식점1', '거리','전화번호'],
  ['음식점2', '거리','전화번호'],
  ['음식점3', '거리','전화번호'],
  ['음식점4', '거리','전화번호'],
  ['음식점5', '거리','전화번호'],
  ['음식점6', '거리','전화번호'],
  ['음식점7', '거리','전화번호'],
  ['음식점8', '거리','전화번호'],
  ['음식점9', '거리','전화번호'],
  ['음식점10', '거리','전화번호'],
  ['음식점11', '거리','전화번호'],
  ['음식점12', '거리','전화번호'],
];