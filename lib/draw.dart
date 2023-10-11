import 'dart:ui' as ui show Codec, FrameInfo, Image;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawingBoard(),
    );
  }
}

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {




  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load('images/1.jpg');
    final List<int> bytes = data.buffer.asUint8List();

    final ui.Codec codec = await PaintingBinding.instance.instantiateImageCodec(Uint8List.fromList(bytes));
    final ui.FrameInfo frameInfo = await codec.getNextFrame();

print('----------------------------${frameInfo.duration}');
  }


















  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  List<DrawingPoint>? drawingPoints = [];
  List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellow,
    Colors.amberAccent,
    Colors.purple,
    Colors.green,
  ];
  double currentX = 0.0;
  double currentY = 0.0;
  List drawingPointsXY = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height/6,
              right: -MediaQuery.of(context).size.width/6,
              child: Image.asset('images/1.jpg')),
          GestureDetector(
            onPanStart: (details) {
              loadImage();
              setState(() {
                drawingPoints!.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },
            onPanUpdate: (details) {
              setState(() {
                drawingPoints!.add(
                  DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              });

              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                currentX = renderBox.globalToLocal(details.globalPosition).dx;
                currentY = renderBox.globalToLocal(details.globalPosition).dy;
                int x = int.parse(currentX.toString()).ceil();
                int y = int.parse(currentY.toString()).ceil();
                drawingPointsXY.addAll([x,y]);
              });

print(drawingPointsXY);
            },
            onPanEnd: (details) {
              setState(() {
                drawingPoints!.add(Offset.zero as DrawingPoint);
              });
            },
            child: CustomPaint(
              painter: _DrawingPainter(drawingPoints!),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
    top: 180,
    right: 30,
            child: Text(
              'الإحداثيات: (${currentX.toStringAsFixed(2)}, ${currentY.toStringAsFixed(2)},)',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: Row(
              children: [
                Slider(
                  min: 0,
                  max: 40,
                  value: strokeWidth,
                  onChanged: (val) => setState(() => strokeWidth = val),
                ),
                ElevatedButton.icon(
                  onPressed: () {

                    setState(() {

                      currentX = 0;
                      currentY = 0;
                      drawingPoints = [];
                    } );

                  },
                  icon: Icon(Icons.clear),
                  label: Text("Clear Board"),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              colors.length,
                  (index) => _buildColorChose(colors[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorChose(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;

  _DrawingPainter(this.drawingPoints);

  List<Offset> offsetsList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length; i++) {
      if (drawingPoints[i + 1] != null) {
        canvas.drawLine(drawingPoints[i].offset, drawingPoints[i + 1].offset,
            drawingPoints[i].paint);
      } else if (drawingPoints[i + 1] == null) {
        offsetsList.clear();
        offsetsList.add(drawingPoints[i].offset);

        canvas.drawPoints(
            PointMode.points, offsetsList, drawingPoints[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}


