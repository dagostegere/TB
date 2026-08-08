import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import '../components/dialog.dart';
import 'dart:async';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  final phoneNumberinpController = Get.find<PhoneNumberInputController>();
  final textController = TextEditingController();

  late PageController _pageController;
  int _currentPage = 0;
  int _realIndex = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    'images/5ani.jpg',
    'images/3.jpg',
    'images/1.jpg',
    'images/4.jpg',
    'images/55.jpg',
  ];

  final int _maxPage = 1000;
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    
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

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<int> phonenumbers = [
    945925292,
    982323201,
    911902453,
    942475555,
    944282845,
    924657777,
    920746702,
    930594279,
    911244873,
    921801767,
    964063143
    ]; // Example recent numbers

  // Proceeds with the normal "send money" flow (loading dialog + navigation)
  void _proceedToSendMoney() {
    LoadingDialog loadingDialog = Get.put(LoadingDialog());
    loadingDialog.showLoadingDialog();

    phoneNumberinpController.setPhoneNumber(int.tryParse(textController.text) ?? 0);
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.toNamed('sendMoney');
    });
  }

  // Shows the "customer is not registered" confirmation popup
  void _showUnregisteredDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 28, 24, 24),
                child: Text(
                  "The customer is not registered, the recipient can access the money by registering for telebirr. Would you like to continue to send the money?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
              ),
              Divider(height: 1, thickness: 1, color: Color.fromARGB(255, 230, 230, 230)),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          alignment: Alignment.center,
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(width: 1, thickness: 1, color: Color.fromARGB(255, 230, 230, 230)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                          _proceedToSendMoney();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          alignment: Alignment.center,
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 141, 197, 64),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,  // this is sooooooo usefullllll bruhhh  - used for prevent elements from pushed up when the device's keyboard appears
      body: SafeArea( // Prevents UI from being under the status bar
        child: SizedBox(
          height: double.infinity, // Makes Column take full screen height
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 243, 239, 239),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back, size: 20, color: Colors.black),
                            // SizedBox(width: 20),
                            Text("Send Money to Individual", 
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                    Container( // Image holder
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 4),

                      height: 110,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_imagePaths.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 6, left: screenWidth * 0.006, right: screenWidth * 0.006),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      child: Container(
                        width: double.infinity,
                        height: 195,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [                                                                                                                                                                                                                                                                                                                                                                                                                        
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                              child: Text("Mobile Number", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: _isFocused 
                                        ? Color.fromARGB(255, 248, 207, 73) 
                                        : Color.fromARGB(255, 189, 189, 188),
                                    width: 0.5,
                                  ),
                                  boxShadow: _isFocused ? [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 248, 207, 73),
                                      blurRadius: 0,
                                      spreadRadius: 1.5,
                                    )
                                  ] : [],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '+251',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        controller: textController,
                                        focusNode: _focusNode,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Mobile Number',
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(255, 164, 163, 163),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                                        ),
                                      ),
                                    ),
                                    Image.asset('images/icon.jpg'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13),
                              child: ElevatedButton(
                                onPressed: () {
                                  int? input = int.tryParse(textController.text);

                                  if (input != null && phonenumbers.contains(input)) {
                                    // Number is registered/known -> proceed as normal
                                    _proceedToSendMoney();
                                  } else {
                                    // Number is not in the known list -> show the popup
                                    _showUnregisteredDialog();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 47),
                                  backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text("Next", style: TextStyle(fontSize: 17)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 243, 239, 239),
                  width: double.infinity,
                  padding: EdgeInsets.all(9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7),
                      Container(
                        height: 26,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/merchant1');
                              }, 
                              child:  Text(
                              "Recent",
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed('/accountinput');
                              },
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Color.fromARGB(255, 191, 190, 190),
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Yordanos", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 141, 197, 64), size: 13),
                                  ],
                                ),
                              ),
                              // Divider(thickness: 0.5),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Yafet", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 13),
                                  ],
                                ),
                              ),
                              // Divider(thickness: 0.5),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Kalkidan", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 13),
                                  ],
                                ),
                              ),
                              // Divider(thickness: 0.5),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Mitiku", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 13),
                                  ],
                                ),
                              ),
                              // Divider(thickness: 0.5),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Biniyam", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 13),
                                  ],
                                ),
                              ),
                              // Divider(thickness: 0.5),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 141, 197, 64), size: 38),
                                        SizedBox(width: 5),
                                        Text("Tariku", style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 13),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}