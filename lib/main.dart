import 'package:flutter/material.dart';
import '/pages/finalPage.dart';
import 'pages/sendMoneyPage.dart';
import '/pages/phoneNumInp.dart';
import 'package:get/get.dart';
import '/controller/phoneNumInpController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/bank/account_input.dart';
import 'pages/bank/final_bank.dart';
import 'pages/bank/sendbank.dart';
import 'pages/bank/addName.dart';
import 'pages/bank/pin.dart';
// flutter run -d chrome --web-browser-flag "--disable-cache"
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telebirr',
      initialRoute: '/accountinput',
      getPages: [
        GetPage(name: '/phoneNumberInput', page: ()=> PhoneNumberInput()),
        GetPage(name: '/sendMoney', page: ()=> SendMoneyPage()),
        GetPage(name: '/finalPage', page: () => FinalPage()),
        GetPage(name: '/finalbank', page: () => FinalBank()),
        GetPage(name: '/sendbank', page: () => Sendbank()),
        GetPage(name: '/accountinput', page: () => AccountInput()),
        GetPage(name: '/addName', page: () => Add()),
        // GetPage(name: '/pin', page: () => Pin()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(PhoneNumberInputController());
      }),
    );
  }
}
