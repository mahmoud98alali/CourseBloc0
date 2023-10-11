import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCompressorWidget(),
    );
  }
}
//
// class ImageCompressionScreen extends StatefulWidget {
//   @override
//   _ImageCompressionScreenState createState() => _ImageCompressionScreenState();
// }
//
// class _ImageCompressionScreenState extends State<ImageCompressionScreen> {
//   List<Uint8List> compressedImages = [];
//
//   Future<void> compressAndDisplayImage() async {
//     // Replace 'your_image_path' with the actual path of your image.
//     String imagePath = 'images/1.jpg';
//
//     File file = File(imagePath);
//
//     if (file.existsSync()) {
//       Uint8List imageBytes = file.readAsBytesSync();
//       img.Image? image = img.decodeImage(imageBytes);
//
//       if (image != null) {
//         // Compress the image
//         img.Image compressedImage = img.copyResize(image, width: 200);
//
//         // Convert the compressed image to bytes
//         Uint8List compressedBytes = Uint8List.fromList(img.encodeJpg(compressedImage));
//
//         setState(() {
//           compressedImages.add(compressedBytes);
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ضغط وعرض الصور'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: (){
//               compressAndDisplayImage();
//               print(compressedImages.last);
//             },
//             child: Text('ضغط الصورة وعرضها'),
//           ),
//           if (compressedImages.isNotEmpty)
//             Image.memory(compressedImages.last),
//         ],
//       ),
//     );
//   }
// }
