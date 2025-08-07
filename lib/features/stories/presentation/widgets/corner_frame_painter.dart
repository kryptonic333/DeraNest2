import 'package:flutter/material.dart';

class CornerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    double cornerLength = 30;

    // Adjust to account for stroke width
    double width = size.width;
    double height = size.height;

    // Top Left
    canvas.drawLine(Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, cornerLength), paint);

    // Top Right
    canvas.drawLine(Offset(width, 0), Offset(width - cornerLength, 0), paint);
    canvas.drawLine(Offset(width, 0), Offset(width, cornerLength), paint);

    // Bottom Left
    canvas.drawLine(Offset(0, height), Offset(0, height - cornerLength), paint);
    canvas.drawLine(Offset(0, height), Offset(cornerLength, height), paint);

    // Bottom Right
    canvas.drawLine(Offset(width, height), Offset(width - cornerLength, height), paint);
    canvas.drawLine(Offset(width, height), Offset(width, height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
