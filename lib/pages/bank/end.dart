import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'dart:async';
import 'package:telebirr/controller/phoneNumInpController.dart';


class EndPage extends StatefulWidget {
  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  final merchantidcontrollerfile = Get.find<PhoneNumberInputController>();
  late PageController _pageController;
  int _currentPage = 0;
  int _realIndex = 0;
  late Timer _timer;
  late String _transactionNumber;
  late String _transactionTime; // ← ADDED

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
  _transactionNumber = generateTransactionNumber();
  _transactionTime = getCurrentDateTime(); // make sure this line exists
  _currentPage = _maxPage ~/ 2;
  _pageController = PageController(initialPage: _currentPage);

  _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
    if (!mounted) return; // ← ADD THIS to fix the PageController error
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
    return DateFormat('yyyy/MM/dd HH:mm:ss').format(now);
  }

  String generateTransactionNumber() {
    const String alphanumeric = "ABCDEHIJLMPRSTVXYZ1234567890";
    Random random = Random();
    String middle_six = List.generate(8, (index) => alphanumeric[random.nextInt(alphanumeric.length)]).join();
    return "DF" + middle_six;
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.085),
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.26,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/d.png", width: 14, height: 14),
                    Text(".", style: TextStyle(color: Colors.white)),
                    Container(
                      margin: EdgeInsets.only(top: 2, left: 2),
                      child: Text("Download", 
                      style: TextStyle(
                                color: Color.fromARGB(255, 106, 183, 71),
                                fontSize: 14
                                )),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.3),
              Container(
                width: screenWidth * 0.2,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share_outlined, size: 14, color: Color.fromARGB(255, 106, 183, 71)),
                    Text("..", style: TextStyle(color: Colors.white)),
                    Text("Share",
                      style: TextStyle(
                        color: Color.fromARGB(255, 106, 183, 71),
                        fontSize: 14
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
                    FaIcon(FontAwesomeIcons.solidCircleCheck, size: 47, color: Color.fromARGB(255, 141, 197, 64)),
                    SizedBox(height: 15),
                    Text("Successful", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 17, fontWeight: FontWeight.normal))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.1,
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: '${NumberFormat('#,###').format(merchantidcontrollerfile.merchantamount.value)}.00',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' (ETB)',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: Colors.black),
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
                  children: [
                    _transactionRow("Transaction Time:", _transactionTime), // ← CHANGED
                    _transactionRow("Transaction Type:", "Buy Goods"),
                    _transactionRow("Transaction To:", "${merchantidcontrollerfile.merchantName.value}"),
                    _transactionRow("Transaction Number:", _transactionNumber),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("images/c.jpg", width: 20, height: 20),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/givetip');
                          },
                          child: Text(
                            "Give Tip",
                            style: TextStyle(
                              color: Color.fromARGB(255, 106, 183, 71),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 25),
                        Icon(Icons.qr_code, color: Color.fromARGB(255, 106, 183, 71), size: 21),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/qr');
                          },
                          child: Text(
                            "QR Code",
                            style: TextStyle(
                              color: Color.fromARGB(255, 106, 183, 71),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
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
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_imagePaths.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.006),
                    width: screenWidth * 0.02,
                    height: screenWidth * 0.02,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _realIndex == index
                          ? Color.fromARGB(255, 141, 197, 64)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color.fromARGB(255, 141, 197, 64),
                        width: 1.5,
                      ),
                    ),
                  );
                }),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.1,
                margin: EdgeInsets.only(top: 35),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Get.toNamed('/billshare');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth * 0.4, 50),
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          foregroundColor: Color.fromARGB(255, 141, 197, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side : BorderSide(
                              color: Color.fromARGB(255, 141, 197, 64),
                              width: 1.0,
                            ),
                          )
                        ),
                        child: Text("Bill Share", style: TextStyle(fontSize: 18),),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Get.toNamed('/merchant1');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth * 0.4, 50),
                          backgroundColor: Color.fromARGB(255, 141, 197, 64),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          )
                        ),
                        child: Text("Finished", style: TextStyle(fontSize: 18),),
                      ),
                    ],
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

  Widget _transactionRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
        Text(value, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}