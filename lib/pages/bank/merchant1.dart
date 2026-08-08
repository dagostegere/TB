import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../components/dialog.dart';
import 'pin.dart';
import 'package:intl/intl.dart'; //
import 'merchantPin.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'qrpage.dart';

class PayForMerchantPage extends StatefulWidget {
  const PayForMerchantPage({super.key});

  @override
  State<PayForMerchantPage> createState() => _PayForMerchantPageState();
}

class _PayForMerchantPageState extends State<PayForMerchantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Color primaryGreen = const Color(0xFF8CC63F);

  final merchantidcontrollerfile = Get.find<PhoneNumberInputController>();
  final merchantidcontroller = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  late PageController _pageController;
  int _currentPage = 0;
  int _realIndex = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    'images/5ani.jpg',
    'images/3.jpg',
    'images/1.jpg',
    'images/4.jpg',
  ];

  final int _maxPage = 1000;

  // Amount controller
  bool _showCustomKeypad = false;

  // ---- ADDED: central place to map a merchant ID to a name ----
  String _resolveMerchantName(int id) {
    switch (id) {
      case 43243:
        return "abebe bikila";
      case 111:
        return "dgdlast bikila";
      case 123:
        return "Sheraton Addis";
      case 731472:
        return "CHITo TRADING PLC";
      case 514731:
       return "AMBASSADOR GARMENT AND TRADE PLC GAME ZONE";
      default:
        return merchantidcontrollerfile.merchantName.value;
    }
  }
  // ---- END ADDED ----

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _currentPage = _maxPage ~/ 2;
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (!mounted) return;
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      if (_currentPage >= _maxPage - 1) {
        _currentPage = _maxPage ~/ 2;
        _pageController.jumpToPage(_currentPage);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onKeyTap(String value) {
    setState(() {
      if (value == 'backspace') {
        if (_amountController.text.isNotEmpty) {
          _amountController.text = _amountController.text
              .substring(0, _amountController.text.length - 1);
        }
      } else if (value == '.') {
        if (!_amountController.text.contains('.')) {
          _amountController.text += value;
        }
      } else {
        _amountController.text += value;
      }
    });
  }

  // ---- ADDED: opens the QR scanner and fills the Merchant ID field ----
  Future<void> _openQrScanner() async {
    final scannedValue = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QrScanPage()),
    );
    if (scannedValue != null) {
      setState(() {
        merchantidcontroller.text = scannedValue.toString();
      });
    }
  }
  // ---- END ADDED ----

  Widget _errorDialogContent(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13.6,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
  void _showErrorDialog(String message) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Error",
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 250),

      pageBuilder: (context, animation, secondaryAnimation) {
        return const SizedBox(); // required placeholder
      },

      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.6,
              end: 1.0,
            ).animate(curvedAnimation),
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: _errorDialogContent(message),
              ),
            ),
          ),
        );
      },
    );

    // auto close after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    });
  }

  void showPaymentModal(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: screenHeight * 0.55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(
                255, 244, 242, 242),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton
                            .styleFrom(
                          elevation: 0,
                          backgroundColor:
                              Color.fromARGB(255,
                                  244, 242, 242),
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide.none),
                        ),
                        child: Icon(Icons.close,
                            size: 25,
                            color: Colors.black),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(
                                right: 16),
                        child: Text(
                          "Use Face ID",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(
                                255, 141, 197, 64),
                            // fontWeight:
                            //     FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Column(
                    children: [
                      // ---- CHANGED: wrapped in Obx so it updates live ----
                      Obx(() => Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "Pay to ", style: TextStyle(fontSize: 14, color: Colors.black87)),
                              TextSpan(
                                text: merchantidcontrollerfile.merchantName.value == "AMBASSADOR GARMENT AND TRADE PLC GAME ZONE"
                                    ? "AMBASSADOR GARMENT AND TRADE PLC..."
                                    : merchantidcontrollerfile.merchantName.value,
                                style: TextStyle(fontSize: merchantidcontrollerfile.merchantName.value == "AMBASSADOR GARMENT AND TRADE PLC GAME ZONE" ? 13.4 : 14, color: Colors.black87),
                              ),
                            ],
                          ),
                        )),
                      // ---- END CHANGED ----
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Obx(() => Text.rich(
                                TextSpan(
                                  text: '${NumberFormat('#,###').format(merchantidcontrollerfile.merchantamount.value)}.00',
                                  style: TextStyle(
                                      fontSize: 31,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "ETB",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding:
                            EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5),
                        height: 130,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(
                                    Radius.circular(
                                        10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width:
                                    double.infinity,
                                height: 40,
                                alignment: Alignment
                                    .centerLeft,
                                padding:
                                    EdgeInsets.all(
                                        10),
                                margin: EdgeInsets
                                    .symmetric(
                                        horizontal: 5),
                                child: Text(
                                    "Payment Method",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal:10),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                        Icons.account_balance_wallet,
                                        color: Color
                                            .fromARGB(
                                                255,
                                                141,
                                                197,
                                                64),
                                        size: 26),
                                    SizedBox(
                                        width: 1),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                        children: [
                                          Text(
                                              "Balance",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal)),
                                          Text(
                                              "(Available Balance:9034.72ETB)",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: 80),
                                    Icon(
                                        Icons
                                            .check_circle,
                                        color: Color
                                            .fromARGB(
                                                255,
                                                141,
                                                197,
                                                64),
                                        size: 23),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(
                                horizontal: 17,
                                vertical: 3),
                        margin: EdgeInsets.only(
                            top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            merchantidcontrollerfile.merchantamount.value = int.parse(_amountController.text);
                            merchantidcontrollerfile.setMerchantId(int.parse(merchantidcontroller.text));
                            Navigator.pop(context);
                            LoadingDialog loadingDialog = Get.put(LoadingDialog());
                            loadingDialog.showLoadingDialog();
                            Get.back();
                            MerchantPin().show(context);
                                
                          },
                          style: ElevatedButton
                              .styleFrom(
                            backgroundColor:
                                Color.fromARGB(255,
                                    141, 197, 64),
                            foregroundColor:
                                Colors.white,
                            minimumSize: Size(
                                screenWidth * 0.85,
                                50),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(8),
                            ),
                          ),
                          child: Text("Pay",
                              style: TextStyle(
                                  fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  InputDecoration inputDecoration(
    String hint, {
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Color(0xFFF1F1F1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 248, 193, 66),
          width: 1.8,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFF1F1F1),
        ),
      ),
    );
  }

  // Exactly like sendbank's _buildKey
  Widget _buildKey(dynamic label) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: () {
            if (label == Icons.backspace_outlined) {
              _onKeyTap('backspace');
            } else {
              _onKeyTap(label.toString());
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3), side: BorderSide.none),
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 11),
          ),
          child: label is String
              ? Text(label, style: TextStyle(fontSize: 22))
              : const Icon(Icons.backspace_outlined,
                  color: Colors.black, size: 18),
        ),
      ),
    );
  }

  Widget _buildCustomKeypad(double screenWidth, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Chevron — tapping hides the keypad
          GestureDetector(
            onTap: () {
              setState(() => _showCustomKeypad = false);
            },
            child: Container(
              width: double.infinity,
              color: Color(0xFFF7F7F7),
              child: Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.grey),
            ),
          ),

          // Keypad grid — exactly like sendbank
          Container(
            color: Color(0xFFF7F7F7),
            padding: EdgeInsets.all(7),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left 3 columns
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Row 1: 1, 2, 3
                        Row(
                          children: [
                            _buildKey("1"),
                            _buildKey("2"),
                            _buildKey("3"),
                          ],
                        ),
                        // Row 2: 4, 5, 6
                        Row(
                          children: [
                            _buildKey("4"),
                            _buildKey("5"),
                            _buildKey("6"),
                          ],
                        ),
                        // Row 3: 7, 8, 9
                        Row(
                          children: [
                            _buildKey("7"),
                            _buildKey("8"),
                            _buildKey("9"),
                          ],
                        ),
                        // Row 4: 0 (wide), .
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () => _onKeyTap("0"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        side: BorderSide.none),
                                    elevation: 0,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 11),
                                  ),
                                  child:
                                      Text("0", style: TextStyle(fontSize: 22)),
                                ),
                              ),
                            ),
                            _buildKey("."),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Right column: backspace (top) + Pay button (tall)
                  SizedBox(
                    width: (screenWidth - 14) / 4,
                    child: Column(
                      children: [
                        // Backspace
                        Container(
                          margin: EdgeInsets.all(3),
                          child: ElevatedButton(
                            onPressed: () => _onKeyTap('backspace'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide.none),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 11),
                              minimumSize: Size(double.infinity, 0),
                            ),
                            child: const Icon(Icons.backspace_outlined,
                                color: Colors.black, size: 18),
                          ),
                        ),
                        // Pay button — fills remaining height like sendbank's Transfer
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (merchantidcontroller.text.isEmpty) {
                                    _showErrorDialog("Enter Merchant ID");
                                return;
                                }

                                if (_amountController.text.isEmpty) {
                                    _showErrorDialog("Enter Amount");
                                  return;
                                }

                                if (!merchantidcontrollerfile.merchant_IDs.contains(int.parse(merchantidcontroller.text))) {
                                  LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                  loadingDialog.showLoadingDialog();
                                  Future.delayed( Duration(milliseconds: 1000), () {
                                    Get.back();
                                    _showErrorDialog("Organization is not exist");
                                  }); 
                                  return;
                                }
                                final int enteredId = int.parse(merchantidcontroller.text);
                                merchantidcontrollerfile.setmerchantamount(
                                  double.parse(_amountController.text).toInt(),
                                );
                                merchantidcontrollerfile.setMerchantId(enteredId);
                                // ---- ADDED: resolve & set name immediately, don't wait for build() ----
                                merchantidcontrollerfile.setMerchantName(_resolveMerchantName(enteredId));
                                // ---- END ADDED ----

                                
                                LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                loadingDialog.showLoadingDialog();
                                Future.delayed( Duration(milliseconds: 1000), () {
                                  Get.back();
                                  showPaymentModal(context);
                                }); 
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 141, 197, 64),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide.none),
                                elevation: 0,
                                padding: EdgeInsets.zero,
                              ),
                              child:
                                  Text("Pay", style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF3F3F3),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    /// HEADER
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            size: 22,
                            color: Colors.black,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Pay for Merchant',
                              style: TextStyle(
                                fontSize: 18.7,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// TOP IMAGE
                    Container(
                      height: 110,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _realIndex = index % _imagePaths.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            final imageIndex = index % _imagePaths.length;
                            return Image.asset(
                              _imagePaths[imageIndex],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// INDICATOR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_imagePaths.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: _dot(index == _realIndex),
                        );
                      }),
                    ),

                    const SizedBox(height: 18),

                    /// TAB BAR
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        dividerColor: Colors.transparent,
                        indicatorColor: primaryGreen,
                        indicatorWeight: 0.5,
                        labelColor: primaryGreen,
                        unselectedLabelColor: Colors.grey.shade600,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        tabs: const [
                          Tab(text: "Pay for Merchant"),
                          Tab(text: "Apply Voucher"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),

              /// SCROLLABLE SECTION ONLY
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    /// TAB 1: Pay for Merchant (unchanged)
                    _showCustomKeypad
                        ? Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: _formContent(screenWidth, screenHeight),
                                ),
                              ),
                              _buildCustomKeypad(screenWidth, screenHeight),
                            ],
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: _formContent(screenWidth, screenHeight),
                                ),
                              ),

                              /// BOTTOM BUTTON
                              Container(
                                padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryGreen,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (merchantidcontroller.text.isEmpty) {
                                          _showErrorDialog("Enter Merchant ID");
                                      return;
                                      }
                                      if (_amountController.text.isEmpty) {
                                          _showErrorDialog("Enter Amount");
                                      return;
                                      }
                                      if (!merchantidcontrollerfile.merchant_IDs.contains(int.parse(merchantidcontroller.text))) {
                                        LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                        loadingDialog.showLoadingDialog();
                                        Future.delayed( Duration(milliseconds: 1000), () {
                                          Get.back();
                                          _showErrorDialog("Organization is not exist");
                                        }); 
                                        return;
                                      }
                                      final int enteredId = int.parse(merchantidcontroller.text);
                                      merchantidcontrollerfile.setmerchantamount(double.parse(_amountController.text).toInt());
                                      merchantidcontrollerfile.setMerchantId(enteredId);
                                      // ---- ADDED: resolve & set name immediately, don't wait for build() ----
                                      merchantidcontrollerfile.setMerchantName(_resolveMerchantName(enteredId));
                                      // ---- END ADDED ----
                                      LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                      loadingDialog.showLoadingDialog();
                                      Future.delayed(Duration(milliseconds: 1000), () {
                                        Get.back();
                                        showPaymentModal(context);
                                      });
                                    },
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                    /// TAB 2: Apply Voucher
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/v.jpg',
                                  width: 220,
                                  height: 220,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Do you want to apply voucher?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 18, 24, 30),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF3F3F3),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              onPressed: () {
                                MerchantPin().show(context);
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formContent(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// MERCHANT ID
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: 'Merchant ID',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          decoration: inputDecoration(
            "Enter Merchant ID",
            suffixIcon: GestureDetector(
              onTap: _openQrScanner,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'images/scan.jpg',
                  width: 17,
                  height: 17,
                ),
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          controller: merchantidcontroller,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        /// OPERATOR ID
        Text(
          "Operator ID",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          decoration: inputDecoration("Enter Operator ID"),
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 10),

        /// SET AMOUNT
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: 'Set Amount',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // ---- ONLY THIS FIELD IS CHANGED ----
        GestureDetector(
          onTap: () {
            setState(() {
              _showCustomKeypad = true;
            });
          },
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: _showCustomKeypad
                    ? Color.fromARGB(255, 248, 193, 66)
                    : const Color(0xFFF1F1F1),
                width: _showCustomKeypad ? 1.8 : 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _amountController.text.isEmpty
                        ? "Enter Amount"
                        : _amountController.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: _amountController.text.isEmpty
                          ? Colors.grey.shade400
                          : Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "ETB",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ---- END OF CHANGE ----

        const SizedBox(height: 12),

        /// ADD NOTE
        Text(
          "Add Note",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          decoration: inputDecoration("Enter Note"),
          style: TextStyle(
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 12),

        /// RECENT
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // do something here
                Get.toNamed('/accountinput');
              },
              child: Text(
                "Recent",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.delete_outline,
              color: Colors.grey.shade500,
              size: 18,
            ),
          ],
        ),

        const SizedBox(height: 12),
        // RECENT
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sheraton Addis",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          "432454",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                Divider(thickness: 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ambassador Gamrment and Game...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          "500260",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                Divider(thickness: 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ETT BY DARCO MANUFACTURING...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          "500260",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                Divider(thickness: 0.2),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  Widget _dot(bool active) {
    return Container(
      width: active ? 8 : 9,
      height: active ? 8 : 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? primaryGreen : Colors.transparent,
        border: Border.all(
          color: primaryGreen,
          width: 0.5,
        ),
      ),
    );
  }
}