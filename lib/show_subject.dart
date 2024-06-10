import 'package:flutter/material.dart';
import 'package:secret_notes/notes_card.dart';

class OneSubjectScreen extends StatelessWidget {
  final List<Map<String, dynamic>> listOfData;
  const OneSubjectScreen({Key? key, required this.listOfData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: listOfData.length,
                itemBuilder: (context, index) {
                  return NotesCard(
                    topic: listOfData[index]["subject"] as String,
                    title: listOfData[index]["title"] as String,
                    content: listOfData[index]["content"] as String,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
