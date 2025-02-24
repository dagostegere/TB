import 'package:get/get.dart';

class PhoneNumberInputController extends GetxController {
  var phoneNumber = 0.obs;
  var userName = ''.obs;
  var amount = 0.obs;
  var originalAmount = 0.obs;
  var accountNumber = 0.obs;
  var accountName = ''.obs;
  var bankAmount = 0.obs;
  var originalBankAmount = 0.obs;

  void setBankAmount (int amount) {
    if(amount < 100) {
      bankAmount.value = amount + 1;
      originalBankAmount.value = amount;
    }
    if(amount > 99 && amount < 500) {
      bankAmount.value = amount + 3;
      originalBankAmount.value = amount;
    }
    if(amount >= 500 && amount < 1000) {
      bankAmount.value = amount + 6;
      originalBankAmount.value = amount;
    }
    if(amount >= 1000 && amount < 5000) {
      bankAmount.value = amount + 7;
      originalBankAmount.value = amount;
    }
    if(amount > 5000) {
      bankAmount.value = amount + 9;
      originalBankAmount.value = amount;
    }
  }

  void setAccountNumber (int value) {
    accountNumber.value = value;
  }
  void setAccountName(String value) {
    accountName.value = value;
  }

  void setPhoneNumber(int number) {
    phoneNumber.value = number;
  }
  void setUserName (String name) {
    userName.value = name;
  }
  void setAmount(int amount_input) {
    if(amount_input < 101) {
      amount.value = amount_input + 1;
      originalAmount.value = amount_input;
    }
    if(amount_input > 100 && amount_input < 600) {
      amount.value = amount_input + 2;
      originalAmount.value = amount_input;
    }
    if(amount_input > 599 && amount_input < 3000) {
      amount.value = amount_input + 4;
      originalAmount.value = amount_input;
    }
    if(amount_input > 2999 && amount_input < 5001) {
      amount.value = amount_input + 6;
      originalAmount.value = amount_input;
    } 
    if(amount_input > 5000) {
      amount.value = amount_input;
      originalAmount.value = amount_input;
    }
  }
}