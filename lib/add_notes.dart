import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AddNotes extends StatelessWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController subjectController = TextEditingController();

    Future<List<Map<String, dynamic>>> readAndParseJsonFile() async {
      final String jsonFile = await rootBundle.loadString('images/data2.json');
      final List<dynamic> jsonData = json.decode(jsonFile);
      return List<Map<String, dynamic>>.from(jsonData);
    }

    Future<void> addDataToFirestore() async {
      final List<Map<String, dynamic>> jsonData = await readAndParseJsonFile();
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('notes');

      for (final Map<String, dynamic> data in jsonData) {
        await collection.add(data);
        print(data);
      }
    }

    Future<void> addData() async {
      CollectionReference users =
          FirebaseFirestore.instance.collection('notes');

      // Replace with your data
      if (imageController.text.trim().isEmpty) {
        imageController.text.trim() ==
            'https://img.freepik.com/free-photo/3d-student-graduation-cap-books-stack_107791-15667.jpg?size=626&ext=jpg&ga=GA1.2.1609798635.1690365622&semt=ais';
      }
      Map<String, dynamic> userData = {
        "title": titleController.text.trim(),
        "subject": subjectController.text.trim(),
        "img:": imageController.text.trim(),
        "content": contentController.text.trim()
      };
      // if ((titleController.text.trim().isNotEmpty &
      //         subjectController.text.trim().isNotEmpty) &
      //     (contentController.text.trim().isNotEmpty)) {
      await users.add(userData);
      print(userData);
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Notes",
          style: GoogleFonts.croissantOne(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(
                  "https://img.freepik.com/free-psd/3d-rendering-search-engine-background_23-2150562455.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais"),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle:
                        GoogleFonts.merriweather(fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.title_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    hintText: "Subject",
                    hintStyle:
                        GoogleFonts.merriweather(fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.subject_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  style: GoogleFonts.merriweather(),
                  controller: contentController,
                  minLines: 10,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Content",
                    hintStyle:
                        GoogleFonts.merriweather(fontWeight: FontWeight.w900),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  controller: imageController,
                  decoration: InputDecoration(
                    hintText: "Image (optional)",
                    hintStyle:
                        GoogleFonts.merriweather(fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.image_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: addData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 3,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Publish",
                      style: GoogleFonts.merriweather(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    // // const Icon(Icons),
                    // Image.network(
                    //   "https://png.pngtree.com/png-clipart/20200817/ourmid/pngtree-3d-bookmark-icon-symbol-on-a-white-background-png-image_2325885.jpg",
                    //   height: 60,
                    //   width: 60,
                    // )
                  ],
                ),
              ),

              //below is code for direct add multiple data in firestore
              // TextButton(
              //   // onPressed: () {
              //   //   Navigator.push(
              //   //     context,
              //   //     MaterialPageRoute(builder: (context) => const Home()),
              //   //   );
              //   // },
              //   onPressed: addDataToFirestore,
              //   child: Container(
              //       padding: const EdgeInsets.all(10),
              //       margin: const EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //           color: Colors.deepPurple,
              //           borderRadius: BorderRadius.circular(15)),
              //       child: const Padding(
              //         padding: EdgeInsets.all(18.0),
              //         child: Text(
              //           "Add Multiple data at once",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
