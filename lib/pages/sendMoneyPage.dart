import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:telebirr/pages/phoneNumInp.dart';
import '../components/dialog.dart';

class SendMoneyPage extends StatelessWidget {
  SendMoneyPage({super.key});
  
  final List<dynamic> buttons = [
    "1", "2", "3", Icons.backspace_outlined, // Backspace icon
    "4", "5", "6", "", // Empty space to align
    "7", "8", "9", "OK",
    "0", ".", ""
  ];
  
  final phoneNumberinpController = Get.find<PhoneNumberInputController>();
  final String nullUsername = 'noUsername';
  RxString amount = "".obs; // Observable string to hold the amount entered
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
    if(phoneNumberinpController.phoneNumber.value == 983017778) {
      setName("LIDIYA");
    }
    if(phoneNumberinpController.phoneNumber.value == 912458225) {
      setName("SOFONIYAS");
    }
    if(phoneNumberinpController.phoneNumber.value == 900000000) {
      setName("DAGMAWI");
    }
    if(phoneNumberinpController.phoneNumber.value == 945925292) {
      setName("Feven");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 242, 242),
        title: const Text("Send Money", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
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
            color: Color.fromARGB(255, 244, 242, 242),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 106, 183, 71),
                    child: Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text("${phoneNumberinpController.userName ?? nullUsername}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                      Obx(() => Text("251${phoneNumberinpController.phoneNumber}", style: TextStyle(color: Colors.grey, fontSize: 15))),
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
                    const Text("Amount", style: TextStyle(fontSize: 16)),
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
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                              controller: textController..text, // Use the SAME controller
                              onChanged: (value) {
                                // Update the amount in the controller
                                phoneNumberinpController.setAmount(int.tryParse(value) ?? 0);
                                // Update the observable amount so the text field can rebuild with the new value.
                              },
                            ),
                          ),
                        ),
                        const Text("(ETB)", style: TextStyle(color: Colors.grey, fontSize: 16)),
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
              child: Text("Add notes(optional)", style: TextStyle(color: Colors.blue, fontSize: 16)),
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.8, // You can adjust this value to get the desired width-to-height ratio
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      if (buttons[index] == "") {
                        return SizedBox.shrink(); // Empty space
                      }

                      return SizedBox(
                        height: 60, // Set the desired height for each button
                        child: ElevatedButton(
                          onPressed: () {
                            phoneNumberinpController.setAmount(int.tryParse(textController.text) ?? 0);
                            if (buttons[index] == "OK") {
                              LoadingDialog loadingDialog = Get.put(LoadingDialog());
                              loadingDialog.showLoadingDialog();
                              Future.delayed(Duration (seconds: 4), () {
                                Get.back();
                                showModalBottomSheet(
                                  isScrollControlled: true, //allows you to control the height of the modal
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
                                                    Obx(() => Text("Send Money to ${phoneNumberinpController.userName}", style: TextStyle(fontSize: 20, color: Colors.black87))),
                                                    Container(
                                                      padding: EdgeInsets.all(8),
                                                      child: Obx(() => 
                                                        Text.rich(
                                                          TextSpan(
                                                            text: '${phoneNumberinpController.amount}.00',
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
                                                                  Obx(() => Text("${phoneNumberinpController.amount}.00ETB", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)))
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
                                                                  Text("1.00ETB", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
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
                                                                  Icon(Icons.account_balance_wallet, color: Color.fromARGB(255, 106, 183, 71), size: 24,),
                                                                  Container(
                                                                    
                                                                    // decoration: BoxDecoration(
                                                                    //   border: Border.all(
                                                                    //     color: Colors.black,
                                                                    //     width: 1
                                                                    //   )
                                                                    // ),
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
                                                                  Icon(Icons.check_circle, color: Color.fromARGB(255, 106, 183, 71), size: 20,)
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
                                                          Future.delayed(Duration (seconds: 8), () {
                                                            Get.back();
                                                            Get.toNamed('/finalPage');
                                                          });
                                                        },
                                                        style : ElevatedButton.styleFrom(
                                                          backgroundColor: Color.fromARGB(255, 106, 183, 71),
                                                          foregroundColor: Colors.white,
                                                          minimumSize: Size(screenWidth * 0.85, 50),
                                                          shape : RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8)
                                                          ),
                                                        ),
                                                        child: Text("Send", style: TextStyle(fontSize: 20),)
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
                              if (amount.value.isNotEmpty) {
                                amount.value = amount.value.substring(0, amount.value.length - 1);
                              }
                            } else {
                              amount.value += buttons[index].toString();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttons[index] == "OK" ? Color.fromARGB(255, 106, 183, 71) : Colors.white,
                            foregroundColor: buttons[index] == "OK" ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                            elevation: 0, // used to remove the box shadow
                          ),
                          child: buttons[index] is String
                              ? Text(buttons[index], style: const TextStyle(fontSize: 22))
                              : const Icon(Icons.backspace_outlined, color: Colors.black, size: 18),
                        ),
                      );
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
