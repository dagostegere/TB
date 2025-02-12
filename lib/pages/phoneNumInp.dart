import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import '../components/dialog.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  final phoneNumberinpController = Get.find<PhoneNumberInputController>();
  final textController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Text("Send Money to Individuals", 
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
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Please Enter Mobile Number", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: double.infinity,
                                height: 55,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                  border: Border.all(color: Color.fromARGB(255, 106, 183, 71), width: 2), // Border
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('+251', 
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 8), // Space between country code and input
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 6.2),
                                          TextField(
                                            keyboardType: TextInputType.phone, // Numeric keyboard
                                            controller: textController,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Mobile Number',
                                              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 20),
                                              border: InputBorder.none, // Remove default underline
                                              isDense: true, // Reduce vertical padding
                                              contentPadding: EdgeInsets.zero, // Remove extra padding
                                            ),
                                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset('images/icon.jpg'),
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

                                  phoneNumberinpController.setPhoneNumber(int.tryParse(textController.text) ?? 0);
                                  Future.delayed(Duration (seconds: 4), () {
                                    Get.back();
                                    Get.toNamed('sendMoney');
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  // backgroundColor: Color.fromARGB(255, 195, 193, 193),
                                  backgroundColor: Color.fromARGB(255, 106, 183, 71),
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
                        child: Row( // recent containerrr
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recent", style: TextStyle(color: Colors.black, fontSize: 20)),
                          Icon(Icons.delete_forever_outlined, 
                            color: Color.fromARGB(255, 191, 190, 190), 
                            size: 24, // Reduced size
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
                                        Icon(Icons.account_circle,color: const  Color.fromARGB(255, 106, 183, 71), size: 45),
                                        SizedBox(width: 5),
                                        Text("TESSEMA", style : TextStyle(fontSize: 19)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const  Color.fromARGB(255, 106, 183, 71), size: 15),
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
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 106, 183, 71), size: 45),
                                        SizedBox(width: 5),
                                        Text("YAFET", style : TextStyle(fontSize: 19)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 15),
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
                                        Icon(Icons.account_circle, color: const Color.fromARGB(255, 106, 183, 71), size: 45),
                                        SizedBox(width: 5),
                                        Text("TEMESGEN", style : TextStyle(fontSize: 19)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 15),
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
                                        Icon(Icons.account_circle,color: const Color.fromARGB(255, 106, 183, 71), size: 45),
                                        SizedBox(width: 5),
                                        Text("ESTIFANOS", style : TextStyle(fontSize: 19)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 15),
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
                                        Icon(Icons.account_circle,color: const Color.fromARGB(255, 106, 183, 71), size: 45),
                                        SizedBox(width: 5),
                                        Text("YAFET", style : TextStyle(fontSize: 19)),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 203, 200, 200), size: 15),
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
