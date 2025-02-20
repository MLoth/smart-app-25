import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundText extends StatelessWidget {
  final String text;

  const BackgroundText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w900,
          color: Colors.grey[100],
        ),
      ),
    );
  }
}
