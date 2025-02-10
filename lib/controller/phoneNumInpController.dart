import 'package:get/get.dart';

class PhoneNumberInputController extends GetxController {
  var phoneNumber = 0.obs;
  var userName = ''.obs;
  var amount = 0.obs;

  void setPhoneNumber(int number) {
    phoneNumber.value = number;
  }
  void setUserName (String name) {
    userName.value = name;
  }
  void setAmount(int amount_input) {
    amount.value = amount_input;
  }
}