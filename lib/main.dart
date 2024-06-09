import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rose Curves',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Rose Curves'),
          actions: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent, // Set background color to transparent if needed
              child: ClipOval(
                child: Image.asset(
                  'assets/image.jpg',
                  fit: BoxFit.cover, // Use BoxFit.cover to ensure the image covers the circular area
                  width: 50, // Ensure width and height are set to the diameter of the CircleAvatar
                  height: 50,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RoseCurvesDemo(),
        ),
      ),
    );
  }
}

class RoseCurvesDemo extends StatefulWidget {
  @override
  _RoseCurvesDemoState createState() => _RoseCurvesDemoState();
}

class _RoseCurvesDemoState extends State<RoseCurvesDemo> {
  double _k = 4.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: RoseCurvesPainter(k: _k),
            child: Center(),
          ),
        ),
        Slider(
          min: 1,
          max: 10,
          divisions: 9,
          label: 'k: ${_k.toStringAsFixed(1)}',
          value: _k,
          onChanged: (value) {
            setState(() {
              _k = value;
            });
          },
        ),
      ],
    );
  }
}

class RoseCurvesPainter extends CustomPainter {
  final double k;

  RoseCurvesPainter({required this.k});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;
    final centerX = width / 2;
    final centerY = height / 2;

    final path = Path();
    for (double t = 0; t < 2 * pi; t += 0.01) {
      final r = 100 * cos(k * t);
      final x = centerX + r * cos(t);
      final y = centerY + r * sin(t);
      if (t == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RoseCurvesPainter oldDelegate) {
    return oldDelegate.k != k;
  }
}