import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/dialog.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:intl/intl.dart';

class Pin {
  final phoneNumberinpController = Get.find<PhoneNumberInputController>();
  void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 300), // <-- Slower animation
      ),
      builder: (context) {
        List<String> pin = [];

        return StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                // Transparent background
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                // PIN box
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Enter PIN',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${NumberFormat('#,###').format(phoneNumberinpController.bankAmount.value)}.00 ',
                                style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'ETB',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            6,
                            (index) => Container(
                              width: 40,
                              height: 38,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 238, 238),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                index < pin.length ? '●' : '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: NumberPad(
                      onKeyTap: (key) {
                        setState(() {
                          if (key == '←') {
                            if (pin.isNotEmpty) pin.removeLast();
                          } else if (key != '' && pin.length < 6) {
                            pin.add(key);
                            if (pin.length == 6) {
                              LoadingDialog loadingDialog = Get.put(LoadingDialog());
                              loadingDialog.showLoadingDialog();
                              Future.delayed(const Duration(seconds: 8), () {
                                Get.back();
                                Get.toNamed('/finalbank');
                              });
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class NumberPad extends StatelessWidget {
  final void Function(String key) onKeyTap;

  const NumberPad({super.key, required this.onKeyTap});

  final List<String> keys = const [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9',
    '', '0', '←'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2.3,
      ),
      itemBuilder: (context, index) {
        final key = keys[index];
        return GestureDetector(
          onTap: () {
            onKeyTap(key);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
                color: const Color.fromARGB(255, 232, 232, 232),
              ),
              color: key.isEmpty || key == '←'
                  ? const Color.fromARGB(255, 232, 232, 232)
                  : Colors.white,
            ),
            alignment: Alignment.center,
            child: key == '←'
                ? const Icon(Icons.backspace_outlined, color: Color.fromARGB(255, 87, 86, 86), size: 20,)
                : Text(
                    key,
                    style: const TextStyle(fontSize: 24),
                  ),
          ),
        );
      },
    );
  }
}
