import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/data.dart';
import 'package:secret_notes/full_note.dart';

class NotesCard extends StatelessWidget {
  final String topic;
  final String title;
  final String content;

  const NotesCard({
    Key? key,
    required this.topic,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullNoteScreen(
              title: title,
              content: content.trim(),
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 0, // Add a subtle elevation for a card-like appearance
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.deepPurple,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      topic.toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "12/2/2",
                    style: GoogleFonts.merriweather(color: Colors.white),
                  )
                  // You can add an icon here for actions if needed
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: GoogleFonts.croissantOne(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 2,
                  ),
                  Text(
                    content.trim(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.merriweather(
                      fontSize:
                          14, // Increased font size for better readability
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
