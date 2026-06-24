import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'QR Code',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // MAIN CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // TITLE
                    const Text(
                      'Payment QR code',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // QR CODE BOX
                    Container(
                      width: 220,
                      height: 220,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'images/qr.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // SUBTITLE
                    const Text(
                      'Scan the QR code to verify payment',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // SHARE + DOWNLOAD ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Share
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_outlined,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(width: 60),

                        // Download
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download_outlined,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _QrCodePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.black;
//     final whitePaint = Paint()..color = Colors.white;

//     // white background
//     canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), whitePaint);

//     final cellCount = 25;
//     final cellSize = size.width / cellCount;

//     // simple pseudo-random QR-like pattern
//     final pattern = [
//       [1,1,1,1,1,1,1,0,1,0,1,1,0,0,1,1,1,1,1,1,1],
//       [1,0,0,0,0,0,1,0,0,1,0,0,1,0,1,0,0,0,0,0,1],
//       [1,0,1,1,1,0,1,0,1,0,1,0,0,0,1,0,1,1,1,0,1],
//       [1,0,1,1,1,0,1,0,0,1,1,1,0,0,1,0,1,1,1,0,1],
//       [1,0,1,1,1,0,1,0,1,1,0,0,1,0,1,0,1,1,1,0,1],
//       [1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,1],
//       [1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1],
//       [0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,0,0,0,0,0,0],
//       [1,0,1,1,0,1,1,1,0,0,1,0,1,1,1,0,1,1,0,1,1],
//       [0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0],
//       [1,1,0,1,1,0,1,0,0,1,1,0,1,0,1,0,0,1,1,0,1],
//       [0,0,1,0,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0,1,0],
//       [1,0,1,0,1,0,1,0,1,1,0,0,1,0,1,0,1,0,1,0,1],
//       [0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,1,0,1,0,1,0],
//       [1,1,1,1,1,1,1,0,0,1,0,0,1,0,1,0,0,0,1,0,1],
//       [1,0,0,0,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,1,0],
//       [1,0,1,1,1,0,1,0,0,1,0,1,1,0,1,0,1,1,0,0,1],
//       [1,0,1,1,1,0,1,1,1,0,1,0,0,1,0,1,0,0,1,0,0],
//       [1,0,1,1,1,0,1,0,0,1,1,0,1,0,1,0,1,0,0,1,1],
//       [1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,1,0,1,0,0,0],
//       [1,1,1,1,1,1,1,0,1,1,0,0,1,0,1,0,0,0,1,1,0],
//     ];

//     for (int row = 0; row < pattern.length; row++) {
//       for (int col = 0; col < pattern[row].length; col++) {
//         if (pattern[row][col] == 1) {
//           canvas.drawRect(
//             Rect.fromLTWH(
//               col * cellSize,
//               row * cellSize,
//               cellSize,
//               cellSize,
//             ),
//             paint,
//           );
//         }
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }