import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/phoneNumInpController.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'dart:async';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final phoneNumberinpcontroller = Get.find<PhoneNumberInputController>();

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
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
    return DateFormat('HH:mm:ss').format(now);
  }
  String generateTransactionNumber() {
    const String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const String alphanumeric = "ABCDEHIJLMPRSTVXYZ1234567890";
    Random random = Random();

    String middle_six = List.generate(8, (index) => alphanumeric[random.nextInt(alphanumeric.length)]).join();

    return "CK" + middle_six;
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
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
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
                    // Icon(Icons.downloading_rounded, size: 17, color: Color.fromARGB(255, 106, 183, 71)),
                    FaIcon(FontAwesomeIcons.download, size: 15, color: Color.fromARGB(255, 106, 183, 71)),
                    Text("Download",
                      style: TextStyle(
                        color: Color.fromARGB(255, 106, 183, 71),
                        fontSize: 20
                      ),
                    ),
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
                    Icon(Icons.share_outlined, size: 17, color: Color.fromARGB(255, 106, 183, 71)),
                    Text("Share",
                      style: TextStyle(
                        color: Color.fromARGB(255, 106, 183, 71),
                        fontSize: 20
                      ),
                    ),
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
                padding : EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.check_circle, size: 50, color : Color.fromARGB(255, 106, 183, 71)),
                    FaIcon(FontAwesomeIcons.solidCircleCheck, size: 50, color: Color.fromARGB(255, 141, 197, 64)),
                    SizedBox(height: 10),
                    Text("Successful", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 20))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.1,
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan( // ወደ ባንክ ሲሆን ማይነስ(-435) አይገባበትምምምምምምምምምምምምምምምምምምምምምምምምምም ከታች ያለው አስታውሥ
                    text: '-' '${NumberFormat('#,###').format(phoneNumberinpcontroller.amount.value)}.00',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
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
                height: screenHeight * 0.2,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ //2025/02/01 12:47:55
                    _transactionRow("Transaction Time:",  "2025/11/16" + " " + getCurrentDateTime()),
                    _transactionRow("Transaction Type:", "Transfer Money"),
                    _transactionRow("Transaction To:", "${phoneNumberinpcontroller.userName}"),
                    _transactionRow("Transaction Number:", generateTransactionNumber()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.qr_code, color: Color.fromARGB(255, 106, 183, 71), size: 19),
                        SizedBox(width: 5),
                        Text("QR Code", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontWeight: FontWeight.bold, fontSize: 19)),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 106, 183, 71), size: 15),
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
                height: screenHeight * 0.1,
                margin: EdgeInsets.only(top: 35),
                child: Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed('/phoneNumberInput');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.4, 50),
                      backgroundColor: Color.fromARGB(255, 141, 197, 64),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                    ),
                    child: Text("Finished", style: TextStyle(fontSize: 19),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 17)),
        Text(value, style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
