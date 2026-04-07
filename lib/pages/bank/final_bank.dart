import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/phoneNumInpController.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'dart:async';

class FinalBank extends StatefulWidget {
  const FinalBank({super.key});

  @override
  State<FinalBank> createState() => _FinalBankState();
}

class _FinalBankState extends State<FinalBank> {
  final phoneNumberinpcontroller = Get.find<PhoneNumberInputController>();

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    'images/5ani.jpg',
    'images/3.jpg',
    'images/1.jpg',
    'images/4.jpg',
    'images/55.jpg',
  ];

  final int _maxPage = 1000;

  @override
  void initState() {
    super.initState();
    _currentPage = _maxPage ~/ 2;
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
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

  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    // return DateFormat('HH:mm:ss').format(now); 
    return DateFormat('yyyy/MM/dd HH:mm:ss').format(now); 
  }

  String generateTransactionNumber() {
    const String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String alphanumeric = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String firstPart = List.generate(6, (index) => alphanumeric[random.nextInt(alphanumeric.length)]).join();
    String last_two_letters = List.generate(2, (index) => letters[random.nextInt(letters.length)]).join();
    return 'DD' + firstPart + last_two_letters;
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.06),
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.3,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(FontAwesomeIcons.download, size: 13, color: Color.fromARGB(255, 106, 183, 71)),
                      Text("Download", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 17)),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.3),
                Container(
                  width: screenWidth * 0.2,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.share_outlined, size: 15, color: Color.fromARGB(255, 106, 183, 71)),
                      Text("Share", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 17)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.solidCircleCheck, size: 50, color: Color.fromARGB(255, 141, 197, 64)),
                      SizedBox(height: 10),
                      Text("Successful", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 18))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.1,
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: '${NumberFormat('#,###').format(phoneNumberinpcontroller.bankAmount.value)}.00',
                      style: TextStyle(fontSize: 39, fontWeight: FontWeight.w600, color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' (ETB)',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.05,
                  alignment: Alignment.center,
                  child: Divider(color: Color.fromARGB(255, 152, 151, 151), thickness: 0.5, indent: 30, endIndent: 30),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _transactionRow("Transaction Number:", generateTransactionNumber(), 15),
                      // _transactionRow("Transaction Time:", "2026/03/24" + " " + getCurrentDateTime(), 16),
                      _transactionRow("Transaction Time:", getCurrentDateTime(), 15),
                      _transactionRow("Transaction Type:", "Transfer to Bank", 15),
                      _transactionRow("Transaction To:", "${phoneNumberinpcontroller.accountName}",
                          phoneNumberinpcontroller.accountName == "BORA AMUSEMENT PARK EMEBET WOLDHER"
                              ? 10
                              : phoneNumberinpcontroller.accountName == "AMBASSADOR GARMENT AND TRADE PLC" //32
                                  ? 10
                                  : phoneNumberinpcontroller.accountName == "DARCO MANUFACTURING AND TRADING PLC" ? 10 : 15),
                      _transactionRow("Bank Account Number:", "${phoneNumberinpcontroller.accountNumber}", 15),
                      _transactionRow("Bank Name:", "Commercial Bank of Ethiopia", 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.qr_code, color: Color.fromARGB(255, 106, 183, 71), size: 16),
                          SizedBox(width: 5),
                          Text("QR Code", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontWeight: FontWeight.w600, fontSize: 15)),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 106, 183, 71), size: 13),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 110,
                  margin: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: PageView.builder(
                      controller: _pageController,
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
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.12,
                  margin: EdgeInsets.only(top: 32),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/accountinput');
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth * 0.4, 48),
                          backgroundColor: Color.fromARGB(255, 141, 197, 64),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                      child: Text(
                        "Finished",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _transactionRow(String title, String value, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)),
        Text(value, style: TextStyle(fontSize: size)),
      ],
    );
  }
}
