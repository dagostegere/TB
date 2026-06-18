import 'package:flutter/material.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:get/get.dart';


class BillSharePage extends StatefulWidget {
  const BillSharePage({super.key});

  @override
  State<BillSharePage> createState() => _BillSharePageState();
}

class _BillSharePageState extends State<BillSharePage> {
  final Color primaryGreen = const Color(0xFF8CC63F);

  final List<Map<String, String>> _members = [
    {'name': 'Dagim', 'phone': '+251 964150933', 'amount': '1.00'},
  ];

  final merchantidcontrollerfile = Get.find<PhoneNumberInputController>();

  String _splitType = 'Equally';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  const Text(
                    'Bill Share',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: primaryGreen,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Create Group',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SELECT FROM GROUP
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _DashedBorderContainer(
                        color: primaryGreen,
                        borderRadius: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group,
                              color: primaryGreen,
                              size: 23,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Select from Group',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ADD NEW MEMBER + EQUALLY
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: primaryGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Add New Member',
                                style: TextStyle(
                                  color: primaryGreen,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              _splitType,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black54,
                              size: 22,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // MEMBER LIST
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _members.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, thickness: 0.5),
                        itemBuilder: (context, index) {
                          final member = _members[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                // Avatar
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primaryGreen,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Name + phone
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        member['name']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        member['phone']!,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Amount
                                  Obx(() => RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${merchantidcontrollerfile.merchantamount.value}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' ETB',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // NEXT BUTTON
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              color: const Color(0xFFF3F3F3),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.white,
                    disabledForegroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DASHED BORDER CONTAINER
class _DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;

  const _DashedBorderContainer({
    super.key,
    required this.child,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: child,
      ),
    );
  }
}

// DASHED BORDER PAINTER
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;

  _DashedBorderPainter({
    required this.color,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rrect);

    const double dashLength = 6;
    const double gapLength = 4;

    for (final metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final end =
            (distance + dashLength).clamp(0.0, metric.length);

        canvas.drawPath(
          metric.extractPath(distance, end),
          paint,
        );

        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}