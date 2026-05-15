import 'dart:io';
import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  final String? imagePath;
  final double size;
  final double borderRadius;

  const AlbumArt({
    super.key,
    this.imagePath,
    this.size = 300,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imagePath != null
            ? Image.file(File(imagePath!), fit: BoxFit.cover)
            : Container(
                color: const Color(0xFF282828),
                child: Icon(Icons.music_note, size: size / 3, color: Colors.grey),
              ),
      ),
    );
  }
}
