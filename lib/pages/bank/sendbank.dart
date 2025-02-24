import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:telebirr/pages/phoneNumInp.dart';
import '../../components/dialog.dart';
import 'package:intl/intl.dart'; // number separator by comma (like this  = 1,000)

class Sendbank extends StatefulWidget {

  Sendbank({super.key});

  @override
  State<Sendbank> createState() => _SendbankState();
}

class _SendbankState extends State<Sendbank> {
  // FocusNode _focusNode = FocusNode(); 
  final List<dynamic> buttons = [
    "1", "2", "3", Icons.backspace_outlined, // Backspace icon
    "4", "5", "6", "", // Empty space to align
    "7", "8", "9", "Transfer",
    "0", ".", ""
  ];

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
    phoneNumberinpController.setAccountName(name);
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if(phoneNumberinpController.accountNumber == 1000123456789) {
      setName("DAGIM TESHOME WORKNEH"); //revolutionary
    }
    if(phoneNumberinpController.accountNumber == 1000225389229) {
      setName("TIGIST WORKNEH ABATE"); //revolutionwater
    }
    if(phoneNumberinpController.accountNumber == 1000366066695) {
      setName("ABIY HAGOS T/BIRHAN"); //revolutionsss
    }
    if(phoneNumberinpController.accountNumber == 1000293169237) {
      setName("BORA AMUSEMENT PARK EMEBET WOLDHER");
    }
    if(phoneNumberinpController.accountNumber == 1000334613031) {
      setName("AMBASSADOR GARMENT AND TRADE PLC");
    }
    if(phoneNumberinpController.accountNumber == 1000435260199) {
      setName("ESAYAS ADMASU TIKU");
    } // smile burger
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 242, 242),
        title: const Text("Transfer to Bank", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 23, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 270,
            color: Color(0xFFF4F4F4),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF9B45E4),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                      ),
                      padding: EdgeInsets.all(20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: Image.asset('images/cbe.jpg', fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Obx(() => Text("${phoneNumberinpController.userName ?? nullUsername}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                              Text("${phoneNumberinpController.accountName == "BORA AMUSEMENT PARK EMEBET WOLDHER" ? "BORA AMUSEMENT PARK EMEB..." : phoneNumberinpController.accountName == "AMBASSADOR GARMENT AND TRADE PLC" ? "AMBASSADOR GARMENT AND TR..." : phoneNumberinpController.accountName}", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 21, fontWeight: FontWeight.bold)),
                              Obx(() => Text("Commercial Bank of Ethiopia(${phoneNumberinpController.accountNumber})", style: TextStyle(color:const Color.fromARGB(255, 216, 215, 215), fontSize: 16)))
                              // Obx(() => Text("251${phoneNumberinpController.phoneNumber}", style: TextStyle(color: Colors.grey, fontSize: 15))),
                            ],
                          ),
                        ],
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
                              const Text("Amount", style: TextStyle(fontSize: 18)),
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
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                                        controller: textController..text, // Use the SAME controller
                                        onChanged: (value) {
                                          // Update the amount in the controller
                                          phoneNumberinpController.setBankAmount(int.tryParse(value) ?? 0);
                                          // Update the observable amount so the text field can rebuild with the new value.
                                        },
                                      ),
                                    ),
                                  ),
                                  const Text("(ETB)", style: TextStyle(color: Colors.grey, fontSize: 16)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text("Balance: 9084(ETB)", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 128, 112, 139))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xFFF4F4F4),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Add notes(optional)", style: TextStyle(color: Color.fromARGB(255, 141, 197, 64), fontSize: 16)),
            ),
          ),
          Expanded(child: Container(color: Color(0xFFF4F4F4))),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF7F7F7),
                  child: Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.grey),
                ),
                Container(
                  color: Color(0xFFF7F7F7),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.8, 
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      if (buttons[index] == "") {
                        return SizedBox.shrink(); 
                      }

                      return Container(
                        // height: 60, // Set the desired height for each button
                        child: ElevatedButton(
                          onPressed: () {
                            phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
                            if (buttons[index] == "Transfer") {
                              LoadingDialog loadingDialog = Get.put(LoadingDialog());
                              loadingDialog.showLoadingDialog();
                              Future.delayed(Duration (seconds: 1), () {
                                Get.back();
                                showModalBottomSheet(
                                  isScrollControlled: true, 
                                  context: context,
                                  builder: (BuildContext context)  {
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
                                              child:
                                                Column(
                                                  children: [
                                                    Text("Transfer to Bank", style: TextStyle(fontSize: 20, color: Colors.black87)),
                                                    Container(
                                                      padding: EdgeInsets.all(8),
                                                      child: Obx(() => 
                                                        Text.rich(
                                                          TextSpan(
                                                            text: '${NumberFormat('#,###').format(phoneNumberinpController.bankAmount.value)}.00',
                                                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
                                                            children: [
                                                              TextSpan(
                                                                text: "ETB",
                                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding : EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                      height: 130,
                                                      width: double.infinity,
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                        width: 400,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                                        ),
                                                        child : Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.all(8),
                                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text("Original Amount", style: TextStyle(fontSize: 18, color: Colors.grey),),
                                                                  Text("${phoneNumberinpController.originalBankAmount}.00ETB", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.all(8),
                                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text("Service fee", style: TextStyle(fontSize: 18, color: Colors.grey),),
                                                                  Text(phoneNumberinpController.bankAmount < 101 ? "1.00" : 
                                                                    phoneNumberinpController.bankAmount > 99 && phoneNumberinpController.bankAmount < 500 ? "3.00" :
                                                                    phoneNumberinpController.bankAmount >= 500 && phoneNumberinpController.bankAmount < 1000 ? "6.00" :
                                                                    phoneNumberinpController.bankAmount >= 1000 && phoneNumberinpController.bankAmount < 5000 ? "7.00" :
                                                                    "9.00", 
                                                                   style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ),
                                                    ),
                                                    Container(
                                                      padding : EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                                                              child: Text("Payment Method", style: TextStyle(fontSize: 18, color: Colors.grey),),
                                                            ),
                                                            Container(
                                                              width: double.infinity,
                                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Icon(Icons.account_balance_wallet, color: Color.fromARGB(255, 141, 197, 64), size: 24,),
                                                                  Container(
                                                                    
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("Balance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                                        Text("(Available Balance:9034.72ETB)", style: TextStyle(fontSize: 14, color: Colors.grey),)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 80),
                                                                  Icon(Icons.check_circle, color: Color.fromARGB(255, 141, 197, 64), size: 20,)
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding : EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                                                      margin: EdgeInsets.only(top: 10),
                                                      child: ElevatedButton(
                                                        onPressed: (){
                                                          LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                                          loadingDialog.showLoadingDialog();
                                                          Future.delayed(Duration (seconds: 9), () {
                                                            Get.back();
                                                            Get.toNamed('/finalbank');
                                                          });
                                                        },
                                                        style : ElevatedButton.styleFrom(
                                                          backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                                          foregroundColor: Colors.white,
                                                          minimumSize: Size(screenWidth * 0.85, 50),
                                                          shape : RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8)
                                                          ),
                                                        ),
                                                        child: Text("Transfer", style: TextStyle(fontSize: 20),)
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

                            } else if (buttons[index] == Icons.backspace_outlined) {
                              // if (amount.value.isNotEmpty) {
                              //   amount.value = amount.value.substring(0, amount.value.length - 1);
                              // }
                                if (amount.value.isNotEmpty) {
                                  amount.value = amount.value.substring(0, amount.value.length - 1);
                                  textController.text = amount.value; // Update the input field
                                  textController.selection = TextSelection.fromPosition(
                                    TextPosition(offset: textController.text.length),
                                );
                              }
                            } else {
                              // amount.value += buttons[index].toString();
                              amount.value += buttons[index].toString();
                              textController.text = amount.value; // Update the input field
                              textController.selection = TextSelection.fromPosition(
                                TextPosition(offset: textController.text.length),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttons[index] == "Transfer" ? Color.fromARGB(255, 141, 197, 64) : Colors.white,
                            foregroundColor: buttons[index] == "Transfer" ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                            elevation: 0, // used to remove the box shadow
                            fixedSize: buttons[index] == "Transfer" ? Size(100, 120) : Size(80, 80),
                          ),
                          child: buttons[index] is String
                              ? Text(buttons[index], style: TextStyle(fontSize: buttons[index] == "Transfer" ? 12 : 22))
                              : const Icon(Icons.backspace_outlined, color: Colors.black, size: 18),
                        ),
                      ); // sized boxxxxxxxx
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

