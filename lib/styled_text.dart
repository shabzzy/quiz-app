import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textstyle extends StatelessWidget {
  const Textstyle({super.key});
  @override
  Widget build(context) {
    return Text(
      'Learn Flutter the fun way!',
      style: GoogleFonts.lato(
        color: Color.fromARGB(255, 237, 223, 252),
        fontSize: 24,
      ),
    );
  }
}
