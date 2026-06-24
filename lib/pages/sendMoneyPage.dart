import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:telebirr/pages/phoneNumInp.dart';
import '../components/dialog.dart';
import 'package:intl/intl.dart'; // number separator by comma (like this  = 1,000)
import 'telepin.dart';
class SendMoneyPage extends StatefulWidget {

  SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  // FocusNode _focusNode = FocusNode(); 

  @override
  // void initState() {
    // super.initState();
    // Automatically focus the TextField when the widget is first built
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _focusNode.requestFocus();
    // });
  // }
  // void dispose() {
    // Dispose the FocusNode when the widget is destroyed
  //   _focusNode.dispose();
  //   super.dispose();
  // }

  final phoneNumberinpController = Get.find<PhoneNumberInputController>();

  final String nullUsername = 'noUsername';

  RxString amount = "".obs; 
 // Observable string to hold the amount entered
  final textController = TextEditingController();

  void setName(String name) {
    phoneNumberinpController.setUserName(name);
  }

  void setAmount(int amount) {
    phoneNumberinpController.setAmount(amount);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if(phoneNumberinpController.phoneNumber.value == 986584082) {
      setName("DAGIM");
    }
    if(phoneNumberinpController.phoneNumber.value == 945925292) {
      setName("Feven"); // sambusa
    }
    if(phoneNumberinpController.phoneNumber.value == 982323201) {
      setName("Hana"); // tututu icecream
    }
    if(phoneNumberinpController.phoneNumber.value == 911902453) {
      setName("Abrham"); // abrsh
    } // ---
    if(phoneNumberinpController.phoneNumber.value == 942475555) {
      setName("Amanual"); 
    } // feresegna
    if(phoneNumberinpController.phoneNumber.value == 924657777) {
      setName("Ambachew");  // kemekem 
    } 
    if(phoneNumberinpController.phoneNumber.value == 920746702) {
      setName("Mekdes");  // 4kilo ertb spot 
    } 
    if(phoneNumberinpController.phoneNumber.value == 930594279) {
      setName("Estifanos");  // weloyew 
    } 
    if(phoneNumberinpController.phoneNumber.value == 911244873) {
      setName("Yonathan");  // bolecakkeee 
    } 
    
    if(phoneNumberinpController.phoneNumber.value == 921801767) {
      setName("Felmeta");  // pas 
    } 
    if(phoneNumberinpController.phoneNumber.value == 964063143) {
      setName("zerabruk");  // pas 
    } 
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 242, 242),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Send Money",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            letterSpacing: 0.7,
          ),
        ),
        actions: const [SizedBox(width: 48)], // balances leading
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 244, 242, 242),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 141, 197, 64),
                    child: Icon(Icons.person, color: Colors.white, size: 26),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text("${phoneNumberinpController.userName ?? nullUsername}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15))),
                      Obx(() => Text("251${phoneNumberinpController.phoneNumber}", style: TextStyle(color: Colors.grey, fontSize: 10))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 244, 242, 242),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                ),
                color: Colors.white
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Amount", style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: const Color.fromARGB(255, 148, 143, 143), width: 0.2)
                              )
                            ),
                            child: TextField(
                              keyboardType: TextInputType.none,
                              // readOnly: true,
                              // showCursor: false,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: Colors.black),
                              controller: textController..text, // Use the SAME controller
                              onChanged: (value) {
                                // Update the amount in the controller
                                phoneNumberinpController.setAmount(int.tryParse(value) ?? 0);
                                // Update the observable amount so the text field can rebuild with the new value.
                              },
                            ),
                          ),
                        ),
                        const Text("(ETB)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Add notes(optional)", style: TextStyle(color: const Color.fromARGB(255, 177, 180, 194), fontSize: 11)),
            ),
          ),
          Expanded(child: Container(color: Colors.white)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 244, 242, 242),
                  child: Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.grey),
                ),
                Container(
                  color: Color.fromARGB(255, 244, 242, 242),
                  padding: EdgeInsets.all(7),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left 3 columns: rows of number keys
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              // Row 1: 1, 2, 3
                              Row(
                                children: [
                                  _buildKey(context, "1"),
                                  _buildKey(context, "2"),
                                  _buildKey(context, "3"),
                                ],
                              ),
                              // Row 2: 4, 5, 6
                              Row(
                                children: [
                                  _buildKey(context, "4"),
                                  _buildKey(context, "5"),
                                  _buildKey(context, "6"),
                                ],
                              ),
                              // Row 3: 7, 8, 9
                              Row(
                                children: [
                                  _buildKey(context, "7"),
                                  _buildKey(context, "8"),
                                  _buildKey(context, "9"),
                                ],
                              ),
                              // Row 4: 0 (wide, spans 2 cols), .
                              Row(
                                children: [
                                  // 0 spans 2 columns
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          phoneNumberinpController.setAmount(int.tryParse(textController.text) ?? 0);
                                          amount.value += "0";
                                          textController.text = amount.value;
                                          textController.selection = TextSelection.fromPosition(
                                            TextPosition(offset: textController.text.length),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          overlayColor: Colors.transparent,
                                          splashFactory: NoSplash.splashFactory,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                                          elevation: 0,
                                          padding: EdgeInsets.symmetric(vertical: 11),
                                        ),
                                        child: Text("0", style: const TextStyle(fontSize: 22)),
                                      ),
                                    ),
                                  ),
                                  // dot
                                  _buildKey(context, "."),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Right column: backspace (top) + OK (tall, spans 3 rows)
                        SizedBox(
                          width: (screenWidth - 22) / 4,
                          child: Column(
                            children: [
                              // Backspace button
                              Container(
                                margin: EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () {
                                    phoneNumberinpController.setAmount(int.tryParse(textController.text) ?? 0);
                                    if (amount.value.isNotEmpty) {
                                      amount.value = amount.value.substring(0, amount.value.length - 1);
                                      textController.text = amount.value;
                                      textController.selection = TextSelection.fromPosition(
                                        TextPosition(offset: textController.text.length),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    overlayColor: Colors.transparent,
                                    splashFactory: NoSplash.splashFactory,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(vertical: 11),
                                    minimumSize: Size(double.infinity, 0),
                                  ),
                                  child: const Icon(Icons.backspace_outlined, color: Colors.black, size: 18),
                                ),
                              ),
                              // OK button — fills remaining height (rows 2, 3, 4)
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      phoneNumberinpController.setAmount(int.tryParse(textController.text) ?? 0);
                                      LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                      loadingDialog.showLoadingDialog();
                                      Future.delayed(Duration(seconds: 1), () {
                                        Get.back();
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: screenHeight * 0.6,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(255, 244, 242, 242),
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
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              backgroundColor: Color.fromARGB(255, 244, 242, 242),
                                                              shape: RoundedRectangleBorder(side: BorderSide.none)
                                                            ),
                                                            child: Icon(Icons.close, size: 25, color: Colors.black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Column(
                                                        children: [
                                                          Obx(() => Text("Send Money to ${phoneNumberinpController.userName}", style: TextStyle(fontSize: 14, color: Colors.black87))),
                                                          Container(
                                                            padding: EdgeInsets.all(8),
                                                            child: Obx(() =>
                                                              Text.rich(
                                                                TextSpan(
                                                                  text: '${NumberFormat('#,###').format(phoneNumberinpController.amount.value)}.00',
                                                                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300, color: Colors.black),
                                                                  children: [
                                                                    TextSpan(
                                                                      text: "ETB",
                                                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                            height: 130,
                                                            width: double.infinity,
                                                            alignment: Alignment.center,
                                                            child: Container(
                                                              width: 400,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(8),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text("Original Amount", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                                                        Text("${phoneNumberinpController.originalAmount}.00ETB", style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(8),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text("Service fee", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                                                        Text(phoneNumberinpController.amount < 101 ? "1.00" :
                                                                          phoneNumberinpController.amount > 100 && phoneNumberinpController.amount < 600 ? "2.00" :
                                                                          phoneNumberinpController.amount > 599 && phoneNumberinpController.amount < 3000 ? "4.00" :
                                                                          phoneNumberinpController.amount > 2999 && phoneNumberinpController.amount < 5001 ? "6.00" :
                                                                          "5.00",
                                                                         style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                            height: 130,
                                                            width: double.infinity,
                                                            alignment: Alignment.center,
                                                            child: Container(
                                                              width: 400,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    width: double.infinity,
                                                                    height: 40,
                                                                    alignment: Alignment.centerLeft,
                                                                    padding: EdgeInsets.all(10),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Text("Payment Method", style: TextStyle(fontSize: 13, color: Colors.grey)),
                                                                  ),
                                                                  Container(
                                                                    width: double.infinity,
                                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Icon(Icons.account_balance_wallet, color: Color.fromARGB(255, 141, 197, 64), size: 22),
                                                                        SizedBox(width: 2.5),
                                                                        Container(
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("Balance", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                                                              Text("(Available Balance:9034.72ETB)", style: TextStyle(fontSize: 12, color: Colors.grey))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 70),
                                                                        Icon(Icons.check_circle, color: Color.fromARGB(255, 141, 197, 64), size: 20)
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                                                            margin: EdgeInsets.only(top: 10),
                                                            child: ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                                LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                                                loadingDialog.showLoadingDialog();
                                                                Get.back();
                                                                TPin().show(context);
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                                                foregroundColor: Colors.white,
                                                                minimumSize: Size(screenWidth * 0.85, 50),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(8)
                                                                ),
                                                              ),
                                                              child: Text("Send", style: TextStyle(fontSize: 17))
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                        );
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text("OK", style: const TextStyle(fontSize: 22)),
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
          ),
        ],
      ),
    );
  }

  Widget _buildKey(BuildContext context, String label) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: () {
            phoneNumberinpController.setAmount(int.tryParse(textController.text) ?? 0);
            amount.value += label;
            textController.text = amount.value;
            textController.selection = TextSelection.fromPosition(
              TextPosition(offset: textController.text.length),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            overlayColor: Colors.transparent, // 👈 add this
             splashFactory: NoSplash.splashFactory, // 👈 add this
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 11),
          ),
          child: Text(label, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}