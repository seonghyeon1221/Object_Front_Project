// food_info.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodInfoPage extends StatefulWidget {
  final List<String> selectedCategories;
  final String apiUrl;

  FoodInfoPage(this.selectedCategories, this.apiUrl);

  @override
  _FoodInfoPageState createState() => _FoodInfoPageState();
}

class _FoodInfoPageState extends State<FoodInfoPage> {
  List<dynamic> responseData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          responseData = jsonDecode(response.body);
        });
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Categories: ${widget.selectedCategories}'),
            SizedBox(height: 20),
            Text('Response Data:'),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(responseData.join(', ')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}