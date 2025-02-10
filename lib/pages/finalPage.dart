import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/phoneNumInpController.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  final phoneNumberinpcontroller = Get.find<PhoneNumberInputController>();
  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy/MM/dd HH:mm:ss').format(now);
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
                    FaIcon(FontAwesomeIcons.heart),
                    Text("Download",
                      style: TextStyle(
                        color: Color.fromARGB(255, 106, 183, 71)
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
                        color: Color.fromARGB(255, 106, 183, 71)
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.check_circle, size: 50, color : Color.fromARGB(255, 106, 183, 71)),
                    Text("Successful", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 15))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.1,
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: '-${phoneNumberinpcontroller.amount}.00',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' (ETB)',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black),
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
                    _transactionRow("Transaction Time:", getCurrentDateTime()),
                    _transactionRow("Transaction Type:", "Transfer Money"),
                    _transactionRow("Transaction To:", "${phoneNumberinpcontroller.userName}"),
                    _transactionRow("Transaction Number:", "CB17K2WWRT"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.qr_code, color: Color.fromARGB(255, 106, 183, 71), size: 15),
                        SizedBox(width: 5),
                        Text("QR Code", style: TextStyle(color: Color.fromARGB(255, 106, 183, 71), fontSize: 13)),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 106, 183, 71), size: 13),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height:  100,
                margin: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset('images/t.jpg', fit: BoxFit.cover),
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.1,
                child: Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed('/sendMoney');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.4, 50),
                      backgroundColor: Color.fromARGB(255, 106, 183, 71),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                    ),
                    child: Text("Finished"),
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
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}
