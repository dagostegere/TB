import 'package:flutter/material.dart';
import '/pages/finalPage.dart';
import 'pages/sendMoneyPage.dart';
import '/pages/phoneNumInp.dart';
import 'package:get/get.dart';
import '/controller/phoneNumInpController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      initialRoute: '/phoneNumberInput',
      getPages: [
        GetPage(name: '/phoneNumberInput', page: ()=> PhoneNumberInput()),
        GetPage(name: '/sendMoney', page: ()=> SendMoneyPage()),
        GetPage(name: '/finalPage', page: () => FinalPage())
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(PhoneNumberInputController());
      }),
    );
  }
}
