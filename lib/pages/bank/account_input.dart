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
                                            keyboardType: TextInputType.phone, // Numeric keyboard
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

                                  phoneNumberinpController.setAccountNumber(int.tryParse(textController.text) ?? 0);
                                  Future.delayed(Duration (seconds: 4), () {
                                    Get.back();
                                    Get.toNamed('sendbank');
                                  });
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
                            Text(
                              "Recent",
                              style: TextStyle(color: Colors.black, fontSize: 20),
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
