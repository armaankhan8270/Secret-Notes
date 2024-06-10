import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PdfBox extends StatelessWidget {
  final String pdfname;
  final String pdfsize;
  // final String path;

  const PdfBox({Key? key, required this.pdfname, required this.pdfsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500
                        .withOpacity(0.5), // Color of the shadow
                    spreadRadius: 1, // Spread radius of the shadow
                    blurRadius: 3, // Blur radius of the shadow
                    offset: Offset(
                        0, 3), // Offset of the shadow (horizontal, vertical)
                  ),
                ],
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Row(children: [
              Image.network(
                "https://cdn3d.iconscout.com/3d/premium/thumb/pdf-file-6652311-5504820.png",
                width: 100,
                height: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pdfname,
                    style: GoogleFonts.libreBaskerville(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(pdfsize,
                      style: GoogleFonts.merriweatherSans(fontSize: 12))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
