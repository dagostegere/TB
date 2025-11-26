import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import '../../components/dialog.dart';

class AccountInput extends StatefulWidget {
  const AccountInput({super.key});

  @override
  State<AccountInput> createState() => _AccountInputState();
}

class _AccountInputState extends State<AccountInput> {
  @override
  final phoneNumberinpController = Get.find<PhoneNumberInputController>();
  final textController = TextEditingController();
  List<int> accountNumbers = [
    1000123456789,
    1000434061109,
    1000646095976,
    1000662056646,
    1000711786116,
    1000225389229,
    1000366066695,
    1000293169237,
    1000334613031,
    1000139332238,
    1000473596478,
    1000341620728,
    1000435260199,
    1000349673758,
    1000684695324,
    1000307823105,
    1000568299489,
    1000572055788,
    1000628059792,
    1000571170438,
    1000679755084,
    1000169217398,
    1000309621593,
    1000350526548,
    1000235010732,
    1000004400201,
    1000006955502,
    1000683265652,
    1000335853907,
    1000420578389,
    1000629301333,
    1000494090434,
    1000313612914,
    1000672488625,
    1000329745523,
    1000516722278,
    1000710348751,
    1000313628543,
    1000001838613,
    1000539064359,
    1000706427329,
    1000277101436,
    1000056638467,
    1000203271712,
    1000403709356,
    1000413077412,
    1000723361412,
    1000697759418,
    1000625049974,
    1000446797844,
    1000490301497,
    1000206103063,
    1000001812509,
    1000704448272,
  ];

  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back, size: 23, color: Colors.black),
                            SizedBox(width: 24), // For spacing
                            Text("Transfer to Bank", 
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container( // Image holder
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      height: 110,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)), // Set border radius
                          child: Image.asset(
                            'images/t.jpg',
                            fit: BoxFit.cover, // Adjust how the image fits
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: double.infinity,
                        height: 265,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text("Select Bank", style: TextStyle(fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: double.infinity,
                                height: 45,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                  border: Border.all(color: Color.fromARGB(255, 224, 225, 221), width: 2), // Border
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Commercial Bank of Ethiopia', 
                                      style: TextStyle(fontSize: 18, ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text("Account No", style: TextStyle(fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: double.infinity,
                                height: 45,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                  border: Border.all(color: Color.fromARGB(255, 141, 197, 64), width: 2), // Border
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 8), // Space between country code and input
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 6.2),
                                          TextField(
                                            keyboardType: TextInputType.text, // Numeric keyboard
                                            controller: textController,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Account Number',
                                              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
                                              border: InputBorder.none, // Remove default underline
                                              isDense: true, // Reduce vertical padding
                                              contentPadding: EdgeInsets.zero, // Remove extra padding
                                            ),
                                            style: const TextStyle(fontSize: 18,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                onPressed: () {
                                  LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                  loadingDialog.showLoadingDialog();
                                  int? input = int.tryParse(textController.text);
                                  if (accountNumbers.contains(input) || phoneNumberinpController.accountName.value.isNotEmpty){
                                    phoneNumberinpController.setAccountNumber(int.tryParse(textController.text) ?? 0);
                                    Future.delayed(Duration (seconds: 4), () {
                                      Get.back();
                                      Get.toNamed('sendbank');
                                    });
                                  } else {
                                    Future.delayed(Duration(seconds: 5), () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true, // allows user to tap outside to dismiss
                                        barrierColor: Colors.transparent,
                                        builder: (BuildContext context) {
                                          Future.delayed(Duration(seconds: 5), () {
                                            if (Navigator.canPop(context)) {
                                              Navigator.of(context).pop();
                                            }
                                          });

                                          return Center(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.8), // transparent black
                                                borderRadius: BorderRadius.circular(12), // curved edges
                                              ),
                                              child: const Text(
                                                "Query holder name fail",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                  decoration: TextDecoration.none,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    });

                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  // backgroundColor: Color.fromARGB(255, 195, 193, 193),
                                  backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text("Next", style: TextStyle(fontSize: 19)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded( // This makes the last container take remaining height
                child: Container(
                  color: Color.fromARGB(255, 243, 239, 239),
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center, // Align items in the center
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/addName');
                              }, 
                              child:  Text(
                              "Recent",
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed('/phoneNumberInput');
                              },
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Color.fromARGB(255, 191, 190, 190),
                                size: 24,
                              ),
                              padding: EdgeInsets.zero, // Remove extra padding
                              constraints: BoxConstraints(), // Remove default constraints
                            ),
                          ],
                        ),
                      ),

                      Expanded( // dagi holderrr conatainer
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          child: Image.asset('images/cbe.jpg', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: 13),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("TESSEMA WORKNEH ABATE", style : TextStyle(fontSize: 21)),
                                            Text("Commercial Bank of Ethiopia(1000558789998)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const  Color.fromARGB(255, 141, 197, 64), size: 15),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          child: Image.asset('images/cbe.jpg', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: 13),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("TIGIST ALEMAYEHU ABEBE", style : TextStyle(fontSize: 21)),
                                            Text("Commercial Bank of Ethiopia(1000127766544)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const  Color.fromARGB(255, 141, 197, 64), size: 15),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          child: Image.asset('images/cbe.jpg', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: 13),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("DAGIM TESHOME WORKNEH", style : TextStyle(fontSize: 21)),
                                            Text("Commercial Bank of Ethiopia(1000225469442)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const  Color.fromARGB(255, 141, 197, 64), size: 15),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          child: Image.asset('images/cbe.jpg', fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: 13),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("NATNAEL SAMUEL CHANE", style : TextStyle(fontSize: 19)),
                                            Text("Commercial Bank of Ethiopia(1000225289545)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const  Color.fromARGB(255, 141, 197, 64), size: 15),
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
