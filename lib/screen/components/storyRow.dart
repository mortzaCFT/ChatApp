import 'package:flutter/material.dart';
import 'dart:math';

class storyRow extends StatelessWidget {
  const storyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DashedCircularContainer(),
          SizedBox(width: 16),
                                  
        ],
      ),
    );
  }
}

class DashedCircularContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(60, 60), 
      painter: DashedBorderPainter(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, 
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5; 

    double radius = size.width / 2;
    const int numberOfLines = 16; 
    const double lineLength = 6.0;
    final double angle = (2 * pi) / numberOfLines; 

    for (int i = 0; i < numberOfLines; i++) {
      double startAngle = i * angle;


      double x1 = radius + (radius - lineLength) * cos(startAngle); // Starting point
      double y1 = radius + (radius - lineLength) * sin(startAngle);
      double x2 = radius + radius * cos(startAngle); 
      double y2 = radius + radius * sin(startAngle);

      // Draw the line
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; 
  }
}

