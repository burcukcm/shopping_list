import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameSaveScreen extends StatefulWidget {
  const NameSaveScreen({super.key});

  @override
  State<NameSaveScreen> createState() => _NameSaveScreenState();
}

class _NameSaveScreenState extends State<NameSaveScreen> {
  final TextEditingController _controller = TextEditingController();
  void _saveUserToDevice() async {
    //Bu fonksiyon, SharedPreferences kullanmaya hazır hale getiriyor.prefs değişkeniyle yazma ve okuma
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Save Your Name")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Enter your name"),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () async {}, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
