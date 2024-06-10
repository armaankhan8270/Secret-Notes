import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secret_notes/pdf_box.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Perfect Notes",
          style: GoogleFonts.merriweather(
              fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Divider(
                  indent: 10,
                  height: 10,
                  thickness: 1,
                  endIndent: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                PdfBox(
                  pdfname: "BDA Module 1",
                  pdfsize: "1.mb",
                ),
                SizedBox(
                  height: 10,
                ),
                // Divider(
                //   indent: 10,
                //   height: 10,
                //   thickness: 1,
                //   endIndent: 10,
                // ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < 10; i++)
                  PdfBox(
                    pdfname: "BDA Module $i",
                    pdfsize: "1.$i mb",
                  ),
              ],
            )),
      ),
    );
  }
}
