import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  bool _torchOn = false;
  bool _handled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? value = barcodes.first.rawValue;
    if (value == null) return;

    _handled = true;
    Navigator.pop(context, value);
  }

  Future<void> _toggleTorch() async {
    await _controller.toggleTorch();
    setState(() => _torchOn = !_torchOn);
  }

  Future<void> _pickFromGallery() async {
    final BarcodeCapture? capture = await _controller.analyzeImage('');
    if (capture != null && capture.barcodes.isNotEmpty) {
      final value = capture.barcodes.first.rawValue;
      if (value != null) Navigator.pop(context, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// CAMERA PREVIEW
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),

          /// OVERLAY
          IgnorePointer(
            child: CustomPaint(
              size: Size.infinite,
              painter: _ScannerOverlayPainter(),
            ),
          ),

          /// CORNERS
          Align(
            alignment: const Alignment(0, -0.3), // Aligns perfectly with the 0.35 overlay multiplier
            child: SizedBox(
              width: 260,
              height: 260,
              child: CustomPaint(
                painter: _CornerBracketsPainter(),
              ),
            ),
          ),

          /// BACK BUTTON
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 26),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          
          /// TEXT
          const Align(
            alignment: Alignment(0, 0.53), // Positioned cleanly below the higher scanner box
            child: Text(
              "Align QR code within frame to scan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          /// ✅ FIXED BOTTOM UI (ONLY CHANGE)
          SafeArea(
            child: Align(
              alignment: const Alignment(0, 0.92), // ← was Alignment.bottomCenter
              child: Padding(
                padding: const EdgeInsets.fromLTRB(27, 10, 27, 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// LIGHT
                    GestureDetector(
                      onTap: _toggleTorch,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.35),
                            ),
                            child: Icon(
                              _torchOn
                                  ? Icons.flashlight_on
                                  : Icons.flashlight_on_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Light",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// GALLERY
                    GestureDetector(
                      onTap: _pickFromGallery,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.35),
                            ),
                            child: const Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// OVERLAY
class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double boxWidth = 260;
    final double boxHeight = 260;

    final Rect scanRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.35), // Shifted upward from 0.42 to 0.35
      width: boxWidth,
      height: boxHeight,
    );

    final Path overlayPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final Path cutoutPath = Path()..addRect(scanRect);

    final Path finalPath = Path.combine(
      PathOperation.difference,
      overlayPath,
      cutoutPath,
    );

    canvas.drawPath(
      finalPath,
      Paint()..color = Colors.black.withOpacity(0.55),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// CORNERS
class _CornerBracketsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF4DD0E1)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double length = 24;

    canvas.drawLine(const Offset(0, 0), const Offset(length, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, length), paint);

    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - length, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, length), paint);

    canvas.drawLine(
        Offset(0, size.height), Offset(length, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - length), paint);

    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width - length, size.height),
        paint);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width, size.height - length),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}