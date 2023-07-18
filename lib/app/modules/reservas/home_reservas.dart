import 'dart:math';

import 'package:flutter/material.dart';

class StarBackground extends StatefulWidget {
  @override
  _StarBackgroundState createState() => _StarBackgroundState();
}

class _StarBackgroundState extends State<StarBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Star> _stars;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(minutes: 1),
      );

      _stars = List.generate(
        50,
        (index) => Star(
          x: Random().nextDouble() * MediaQuery.of(context).size.width,
          y: Random().nextDouble() * MediaQuery.of(context).size.height,
          size: Random().nextDouble() * 2 + 1,
          speed: Random().nextDouble() * 0.5 + 0.2,
        ),
      );

      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: StarPainter(
            stars: _stars,
            progress: _controller.value,
          ),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}

class Star {
  final double x;
  final double y;
  final double size;
  final double speed;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
  });
}

class StarPainter extends CustomPainter {
  final List<Star> stars;
  final double progress;

  StarPainter({required this.stars, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    stars.forEach((star) {
      final starPath = Path();
      starPath.moveTo(star.x, star.y);
      starPath.lineTo(star.x - star.size, star.y + star.size);
      starPath.lineTo(star.x + star.size, star.y + star.size);
      starPath.lineTo(star.x, star.y - star.size);
      starPath.close();

      final starPaint = paint..color = paint.color.withOpacity(star.size / 3);

      canvas.drawPath(starPath, starPaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class StarBackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundo de Estrelas em Movimento'),
      ),
      body: StarBackground(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StarBackgroundPage(),
  ));
}
