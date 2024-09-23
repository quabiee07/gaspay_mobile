import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// class ScorePainter extends CustomPainter {
//   final int score;
//   final int maxScore;
//   final String label;
//   final double animationValue;

//   ScorePainter({
//     required this.score,
//     required this.maxScore,
//     required this.label,
//     required this.animationValue,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height * 0.89);
//     final radius = size.width * 0.4;
//     const startAngle = pi;
//     const sweepAngle = pi;

//     final whitePaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 50
//       ..strokeCap = StrokeCap.round;

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle,
//       false,
//       whitePaint,
//     );

//     // Draw light grey background arc
//     final lightGreyPaint = Paint()
//       ..color = Colors.grey[200]!
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8
//       ..strokeCap = StrokeCap.round;

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle,
//       false,
//       lightGreyPaint,
//     );

//     // Draw dashed arc
//     final dashedPaint = Paint()
//       ..color = Colors.grey[300]!
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 12;

//     final innerRadius = radius - 15;
//     const dashLength = 3;
//     const dashSpace = 5;
//     final totalLength = sweepAngle * innerRadius;
//     final dashCount = (totalLength / (dashLength + dashSpace)).floor();

//     for (var i = 0; i < dashCount; i++) {
//       final dashAngle = sweepAngle / dashCount;
//       final dashStart = startAngle + i * dashAngle;
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: innerRadius),
//         dashStart,
//         dashAngle * 0.3,
//         false,
//         dashedPaint,
//       );
//     }

//     // Draw animated score arc
//     final scorePercentage = score / maxScore;
//     final scorePaint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 12
//       ..strokeCap = StrokeCap.round
//       ..color = Colors.orange;

//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle * scorePercentage * animationValue,
//       false,
//       scorePaint,
//     );

//     // Draw "Bad!" text
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: label,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2,
//           center.dy - textPainter.height / 2),
//     );

//     // Draw animated indicator
//     final indicatorPaint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//     final indicatorAngle =
//         startAngle + sweepAngle * scorePercentage * animationValue;
//     final indicatorPoint = Offset(
//       center.dx + radius * cos(indicatorAngle),
//       center.dy + radius * sin(indicatorAngle),
//     );
//     canvas.drawCircle(indicatorPoint, 6, indicatorPaint);
//   }

//   @override
//   bool shouldRepaint(covariant ScorePainter oldDelegate) =>
//       score != oldDelegate.score ||
//       animationValue != oldDelegate.animationValue;
// }

//Copy this CustomPainter code to the Bottom of the File
class ScorePainter extends CustomPainter {
  final int score;
  // final int maxScore;
  // final String label;
  final double animationValue;

  ScorePainter({
    required this.score,
    // required this.maxScore,
    // required this.label,
    required this.animationValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(85.2614, 113.22);
    path_0.cubicTo(72.4851, 126.744, 62.9294, 142.98, 57.308, 160.715);
    path_0.lineTo(67.5339, 163.956);
    path_0.cubicTo(72.6671, 147.762, 81.3928, 132.936, 93.0593, 120.587);
    path_0.lineTo(85.2614, 113.22);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF46A2B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(137.832, 80.2681);
    path_1.cubicTo(120.091, 85.8726, 103.847, 95.4128, 90.3104, 108.176);
    path_1.lineTo(97.6698, 115.981);
    path_1.cubicTo(110.03, 104.326, 124.864, 95.6149, 141.063, 90.4972);
    path_1.lineTo(137.832, 80.2681);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffDDEAFF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(199.17, 76.9124);
    path_2.cubicTo(180.924, 73.2767, 162.093, 73.8102, 144.082, 78.4732);
    path_2.lineTo(146.77, 88.8581);
    path_2.cubicTo(163.217, 84.6002, 180.412, 84.113, 197.073, 87.433);
    path_2.lineTo(199.17, 76.9124);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffDDEAFF).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(255.875, 104.665);
    path_3.cubicTo(241.81, 92.4872, 225.175, 83.6443, 207.213, 78.7969);
    path_3.lineTo(204.418, 89.1537);
    path_3.cubicTo(220.82, 93.5801, 236.009, 101.655, 248.853, 112.775);
    path_3.lineTo(255.875, 104.665);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffDDEAFF).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(290.892, 155.259);
    path_4.cubicTo(284.449, 137.806, 274.145, 122.034, 260.752, 109.122);
    path_4.lineTo(253.306, 116.844);
    path_4.cubicTo(265.536, 128.636, 274.945, 143.037, 280.828, 158.975);
    path_4.lineTo(290.892, 155.259);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffDDEAFF).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    // White Arc Background
    Path path_5 = Path();
    path_5.moveTo(150.872, 24.1584);
    path_5.cubicTo(246.899, 10.8154, 335.561, 77.8441, 348.904, 173.871);
    path_5.cubicTo(362.247, 269.898, 295.218, 358.56, 199.191, 371.903);
    path_5.cubicTo(103.164, 385.246, 14.5025, 318.217, 1.15951, 222.19);
    path_5.cubicTo(-12.1835, 126.163, 54.8452, 37.5014, 150.872, 24.1584);
    path_5.close();
    path_5.moveTo(191.943, 319.741);
    path_5.cubicTo(259.162, 310.401, 306.082, 248.338, 296.742, 181.119);
    path_5.cubicTo(287.402, 113.9, 225.339, 66.98, 158.12, 76.3201);
    path_5.cubicTo(90.9012, 85.6601, 43.9811, 147.723, 53.3212, 214.942);
    path_5.cubicTo(62.6613, 282.161, 124.725, 329.081, 191.943, 319.741);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    //Grey Arc
    Path path_6 = Path();
    path_6.moveTo(156.718, 44.4285);
    path_6.cubicTo(241.321, 32.6728, 319.435, 91.7276, 331.191, 176.331);
    path_6.cubicTo(342.947, 260.934, 283.892, 339.049, 199.289, 350.804);
    path_6.cubicTo(114.685, 362.56, 36.5707, 303.505, 24.8151, 218.902);
    path_6.cubicTo(13.0594, 134.299, 72.1142, 56.1842, 156.718, 44.4285);
    path_6.close();
    path_6.moveTo(198.437, 344.677);
    path_6.cubicTo(279.656, 333.391, 336.349, 258.402, 325.063, 177.182);
    path_6.cubicTo(313.778, 95.9631, 238.788, 39.2706, 157.569, 50.556);
    path_6.cubicTo(76.3497, 61.8415, 19.6572, 136.831, 30.9426, 218.05);
    path_6.cubicTo(42.228, 299.27, 117.218, 355.962, 198.437, 344.677);
    path_6.close();

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xffEBEBF0).withOpacity(1.0);
    canvas.drawPath(path_6, paint6Fill);

    //Indicators
    Path path_7 = Path();
    path_7.moveTo(53.5812, 111.062);
    path_7.cubicTo(52.1789, 110.087, 50.2484, 110.431, 49.301, 111.853);
    path_7.cubicTo(38.6205, 127.881, 31.0225, 145.77, 26.9075, 164.605);
    path_7.cubicTo(22.5724, 184.447, 22.1879, 204.949, 25.776, 224.939);
    path_7.cubicTo(29.3641, 244.93, 36.8545, 264.018, 47.8196, 281.114);
    path_7.cubicTo(58.7847, 298.21, 73.0097, 312.979, 89.6825, 324.577);
    path_7.cubicTo(106.355, 336.176, 125.149, 344.377, 144.991, 348.712);
    path_7.cubicTo(164.834, 353.047, 185.335, 353.432, 205.326, 349.843);
    path_7.cubicTo(225.317, 346.255, 244.405, 338.765, 261.501, 327.8);
    path_7.cubicTo(277.728, 317.392, 291.859, 304.046, 303.172, 288.458);
    path_7.cubicTo(304.176, 287.076, 303.827, 285.146, 302.425, 284.171);
    path_7.cubicTo(301.022, 283.195, 299.097, 283.543, 298.093, 284.925);
    path_7.cubicTo(287.245, 299.846, 273.705, 312.623, 258.161, 322.592);
    path_7.cubicTo(241.749, 333.119, 223.424, 340.31, 204.233, 343.754);
    path_7.cubicTo(185.042, 347.199, 165.36, 346.83, 146.312, 342.668);
    path_7.cubicTo(127.263, 338.506, 109.221, 330.633, 93.2153, 319.499);
    path_7.cubicTo(77.2095, 308.365, 63.5534, 294.186, 53.027, 277.774);
    path_7.cubicTo(42.5005, 261.362, 35.3096, 243.038, 31.8651, 223.846);
    path_7.cubicTo(28.4205, 204.655, 28.7896, 184.974, 32.9514, 165.925);
    path_7.cubicTo(36.8929, 147.885, 44.1633, 130.747, 54.3805, 115.386);
    path_7.cubicTo(55.3267, 113.964, 54.9836, 112.038, 53.5812, 111.062);
    path_7.close();

    // Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    // paint7Fill.color = const Color(0xffE97437).withOpacity(1.0);
    // canvas.drawPath(path_7, paint7Fill);

    // Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    // paint8Fill.color = const Color(0xffF1F7FF).withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width * 0.1715269, size.height * 0.6910263),
    //     size.width * 0.04567600, paint8Fill);

    // Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    // paint9Fill.color = const Color(0xff1875F7).withOpacity(1.0);
    // canvas.drawCircle(
    //   Offset(size.width * 0.1707666, size.height * 0.6892763),
    //   size.width * 0.01714286,
    //   paint9Fill,
    // );

    Path animatedPath7 = Path();
    for (int i = 0; i < path_7.computeMetrics().length; i++) {
      PathMetric pathMetric = path_7.computeMetrics().elementAt(i);
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * animationValue,
      );
      animatedPath7 = Path.combine(
        PathOperation.union,
        animatedPath7,
        extractPath,
      );
    }

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xffE97437).withOpacity(1.0);
    canvas.drawPath(animatedPath7, paint7Fill);

    // Animate the blue indicator
    double angle = pi *
        1.5 *
        (1 -
            animationValue); // Adjust this calculation based on your specific needs
    double radius = size.width * 0;
    double centerX = size.width * 0.1707666;
    double centerY = size.height * 0.6892763;

    double indicatorX = centerX + radius * cos(angle);
    double indicatorY = centerY + radius * sin(angle);

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffF1F7FF).withOpacity(1.0);
    canvas.drawCircle(
      Offset(indicatorX, indicatorY),
      size.width * 0.04567600,
      paint8Fill,
    );

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xff1875F7).withOpacity(1.0);
    canvas.drawCircle(
      Offset(indicatorX, indicatorY),
      size.width * 0.01714286,
      paint9Fill,
    );

    // Draw Label text
    final textPainter = TextPainter(
      text: TextSpan(
        text: _getScoreLabel(score),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.width / 2 - textPainter.width / 2,
          size.height * 0.89 - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant ScorePainter oldDelegate) {
    return score != oldDelegate.score;
  }

  String _getScoreLabel(int score) {
    if (score < 30) {
      return "Bad";
    } else if (score < 70) {
      return "Average";
    } else {
      return "Good";
    }
  }
}
