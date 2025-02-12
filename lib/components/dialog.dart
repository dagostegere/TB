import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  void showLoadingDialog() {
    Get.dialog(
      Center(
        child: Container(
          width: 90,
          height: 90,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: SpinKitCircle(
            color: const Color.fromARGB(255, 112, 206, 116),
            size: 35.0,
            controller: _animationController,
          ),
        ),
      ),
      barrierDismissible: false, 
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
