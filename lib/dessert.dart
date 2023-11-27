import 'package:flutter/material.dart';

class DessertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('디저트'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '디저트 페이지입니다.',
              style: TextStyle(fontSize: 24),
            ),
            // 여기에 디저트 관련한 내용을 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
