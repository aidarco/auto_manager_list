import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text(
          "Страница добавления",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
          controller: textController,
          maxLines: 5,
          decoration:  InputDecoration(
            hintText: "Введите текст...",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
          ),
          ),
        )
      ],),
    );
  }
}
