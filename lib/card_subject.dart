import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/show_subject.dart';

class SubjectCard extends StatelessWidget {
  final String text;
  final Function onPressed;
  final List<Map<String, dynamic>> listOfData;

  SubjectCard(
      {required this.text, required this.onPressed, required this.listOfData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          print(text);
          await onPressed();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OneSubjectScreen(listOfData: listOfData),
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => OneSubjectScreen(listOfData: listOfData)),
          // );)
          // );
          print("pressd $text");
        },
        child: Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.network(
                "https://img.freepik.com/premium-psd/open-book-3d-icon-illustration_460336-906.jpg?size=626&ext=jpg&ga=GA1.2.1609798635.1690365622&semt=ais",
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: GoogleFonts.croissantOne(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
