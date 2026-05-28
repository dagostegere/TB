import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telebirr/controller/phoneNumInpController.dart';
import 'package:telebirr/pages/phoneNumInp.dart';
import '../../components/dialog.dart';
import 'package:intl/intl.dart'; // number separator by comma (like this  = 1,000)
import 'pin.dart';
class Sendbank extends StatefulWidget {

  Sendbank({super.key});

  @override
  State<Sendbank> createState() => _SendbankState();
}

class _SendbankState extends State<Sendbank> {
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
    phoneNumberinpController.setAccountName(name);
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if(phoneNumberinpController.accountNumber == 1000123456789) {
      setName("TOLOSSA FEYESA BEDASA"); //revolutionary
    }
    if(phoneNumberinpController.accountNumber == 1000225389229) {
      setName("TIGIST WORKNEH ABATE"); //revolutionwater
    }
    if(phoneNumberinpController.accountNumber == 1000366066695) {
      setName("ABIY HAGOS T/BIRHAN"); //revolutionsssssss sss
    }
    if(phoneNumberinpController.accountNumber == 1000293169237) {
      setName("BORA AMUSEMENT PARK EMEBET WOLDHER");
    }
    if(phoneNumberinpController.accountNumber == 1000334613031) {
      setName("AMBASSADOR GARMENT AND TRADE PLC");
    } 
    if(phoneNumberinpController.accountNumber == 1000139332238) {
      setName("ALAZAR BEDILU TSEHAY"); // gotera
    }
    if(phoneNumberinpController.accountNumber == 1000473596478) {
      setName("FRIENDSHIP SQUARE"); // friendship
    }
    if(phoneNumberinpController.accountNumber == 1000341620728) {
      setName("BELAYAB FOODS PRODUCTION PLC"); // coldstone icecream
    }
    if(phoneNumberinpController.accountNumber == 1000435260199) {
      setName("ESAYAS ADMASU TIKU"); // smile
    } // smileeeee
    if(phoneNumberinpController.accountNumber == 1000349673758) {
      setName("ABREHAM MESGAN KASAHUN"); // abrhamm
    } 
    if(phoneNumberinpController.accountNumber == 1000684695324) {
      setName("Miss Mirtnesh Feleke Baji"); // omeedla
    }
    if(phoneNumberinpController.accountNumber == 1000307823105) {
      setName("SELAMAWIT GEZAHAGN GESESE"); // sudan
    }
    if(phoneNumberinpController.accountNumber == 1000568299489) {
      setName("WUBALEM GETACHEW ZERIHUN"); // terara grill
    }
    if(phoneNumberinpController.accountNumber == 1000572055788) {
      setName("DIBORA ZERIHUN FIRISO"); // CHAOFAN
    }
    if(phoneNumberinpController.accountNumber == 1000628059792) {
      setName("FISEHA KIFLE AMARE"); // ROBA SPOTTTTTTTTT (4KILO RM)
    }
    if(phoneNumberinpController.accountNumber == 1000571170438) {
      setName("BETHELEHEM BERHANE YEFRU"); //aman entoto (bole food)
    }
    if(phoneNumberinpController.accountNumber == 1000679755084) {
      setName("KONDITOREI CAFE AND CAKE PLC"); // CAKE 
    }
    if(phoneNumberinpController.accountNumber == 1000169217398) {
      setName("AYENEW MISGAN KASAHUN"); // ABRAHAM 
    }
    if(phoneNumberinpController.accountNumber == 1000309621593) {
      setName("WOW BURGER PRODUCTION PLC"); // wowww 
    }
    if(phoneNumberinpController.accountNumber == 1000350526548) {
      setName("MESERET MINWYELET MIHRETE"); // 4kilo food and coffe  
    }
    if(phoneNumberinpController.accountNumber == 1000004400201) {
      setName("AMBACHEW TESFAYE HMARIAM"); // KEMEKEM 
    }
    if(phoneNumberinpController.accountNumber == 1000006955502) {
      setName("BEKELE MOLLA HOTEL PLC"); // hibir 
    }
    if(phoneNumberinpController.accountNumber == 1000683265652) {
      setName("THE ADDRESS TRADING PLC"); // bolenew 
    }
    if(phoneNumberinpController.accountNumber == 1000335853907) {
      setName("BELAY SHIBERU BELAY"); // pastaw 
    }
    if(phoneNumberinpController.accountNumber == 1000420578389) {
      setName("MONARCH HOTEL PLC");  
    }
    if(phoneNumberinpController.accountNumber == 1000629301333) {
      setName("DARCO MANUFACTURING AND TRADING PLC"); // 4kilo icevream
    }
    if(phoneNumberinpController.accountNumber == 1000494090434) {
      setName("BESRAT TILAHUN WELDEKIDAN"); // KBUR 
    }
    if(phoneNumberinpController.accountNumber == 1000313612914) {
      setName("DELMELA TRADING PLC"); // mitmita 
    }
    if(phoneNumberinpController.accountNumber == 1000672488625) {
      setName("BETHELHEM ANDARGE BIRKAYEHU"); //  noodle
    }
    if(phoneNumberinpController.accountNumber == 1000329745523) {
      setName("GIRMA DEGU MAMAS KITCHEN"); //  
    }
    if(phoneNumberinpController.accountNumber == 1000516722278) {
      setName("ANTENEH MEKONEN MENGESHA"); // 4kilo totalmadeya 
    }
    if(phoneNumberinpController.accountNumber == 1000710348751) {
      setName("MAK FAM TRADING PLC"); //PIZZA dicaprio
    }
    if(phoneNumberinpController.accountNumber == 1000313628543) {
      setName("MELNARED TRADING PLC"); //woreda 8 supermarket
    }
    if(phoneNumberinpController.accountNumber == 1000001838613) {
      setName("ANTICA PLC"); //miyamrew spot 
    }
    if(phoneNumberinpController.accountNumber == 1000539064359) {
      setName("HANNA AFEWORK LEMMA"); //bole coffee
    }
    if(phoneNumberinpController.accountNumber == 1000706427329) {
      setName("GO FRESH TRADING PLC"); // goooo fresh
    }
    if(phoneNumberinpController.accountNumber == 1000277101436) {
      setName("TONG DA LPG &BITUMEN PLC-HOTEL"); // china
    }
    if(phoneNumberinpController.accountNumber == 1000056638467) {
      setName("MIRTIE ABEBE WOLDEMACHAEL"); // china
    }
    if(phoneNumberinpController.accountNumber == 1000203271712) {
      setName("EFFI NORDIC SPECIALIZED RESTAURANT"); // atlas rut
    }
    if(phoneNumberinpController.accountNumber == 1000403709356) {
      setName("NAHOM MANALE TASSU"); // ATLAS YOS
    }
    if(phoneNumberinpController.accountNumber == 1000413077412) {
      setName("MICKEY GENERAL INVESTMENT PLC"); // 2K HA
    }
    if(phoneNumberinpController.accountNumber == 1000723361412) {
      setName("WOW BURGER PRODUCTION PLC"); // WOW bole 
    }
    if(phoneNumberinpController.accountNumber == 1000697759418) {
      setName("BAZRA COFFE ONE MEMBER PLC"); // bazra
    }
    if(phoneNumberinpController.accountNumber == 1000625049974) {
      setName("ESETCO TRADING PLC"); // LEBU
    }
    if(phoneNumberinpController.accountNumber == 1000446797844) {
      setName("CHALTU ADICHO KEBEDE"); // LEBU
    }
    if(phoneNumberinpController.accountNumber == 1000490301497) {
      setName("AMNEN PHARMACEUTICALS PLC"); // LIN
    }
    if(phoneNumberinpController.accountNumber == 1000206103063) {
      setName("Mr Sami Ali Ahmed"); // AMBASADOR 
    }
    if(phoneNumberinpController.accountNumber == 1000001812509) {
      setName("MIDROC ETH PLC (SHERATON ADD.)"); // LIN
    }
    if(phoneNumberinpController.accountNumber == 1000704448272) {
      setName("NONNA S PLC"); // PIZZA AMBASADOR
    }
    if(phoneNumberinpController.accountNumber == 1000434061109) {
      setName("TAFESE W.5KILO RESTAU AND LAUNGE"); //
    }
    if(phoneNumberinpController.accountNumber == 1000662056646) {
      setName("BETHELHEM MELESSE SHISHIGE"); //
    } //HIDAR
    if(phoneNumberinpController.accountNumber == 1000711786116) {
      setName("Miss Meron Fesha Yitbarek"); //
    } //adorisi
    if(phoneNumberinpController.accountNumber == 1000646095976) {
      setName("ROMINA PLC"); //
    } //idk
    if(phoneNumberinpController.accountNumber == 1000728750627) {
      setName("MAGS CAFE PLC"); //
    } //MAGS
    if(phoneNumberinpController.accountNumber == 1000657608223) {
      setName("SMILE ONE MEMBER PLC"); //
    } //smile and feresegna
    if(phoneNumberinpController.accountNumber == 1000722771552) {
      setName("ADORSI ONE MEMBER PLC"); //
    } //ADORSI
    if(phoneNumberinpController.accountNumber == 1000432972368) {
      setName("KOMARR PLC"); //
    } //OLIVE
    if(phoneNumberinpController.accountNumber == 1000675828893) {
      setName("SOLINA HOME FURNISHING PLC"); //
    } //OLIVE
    if(phoneNumberinpController.accountNumber == 1000322673691) {
      setName("Mr Selam Bereket Abreham"); //
    } //OLIVE
    if(phoneNumberinpController.accountNumber == 1000597367426) {
      setName("Miss Firut Asrat Birhanu"); //
    } //OLIVE
    if(phoneNumberinpController.accountNumber == 1000741463907) {
      setName("ROKI RESTAURANT ONE MEMBER PLC"); //
    } //OLIVE
    if(phoneNumberinpController.accountNumber == 1000235010732) {
      setName("NIGISTI ADMASU GEGZEABHE"); // 4kilo ROBA RMM 
    }
    

    // Helper to build a single number/backspace button
    Widget _buildKey(dynamic label, {double? widthFactor}) {
      return Expanded(
        flex: widthFactor != null ? 2 : 1,
        child: Container(
          margin: EdgeInsets.all(3),
          child: ElevatedButton(
            onPressed: () {
              phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
              if (label == Icons.backspace_outlined) {
                if (amount.value.isNotEmpty) {
                  amount.value = amount.value.substring(0, amount.value.length - 1);
                  textController.text = amount.value;
                  textController.selection = TextSelection.fromPosition(
                    TextPosition(offset: textController.text.length),
                  );
                }
              } else {
                amount.value += label.toString();
                textController.text = amount.value;
                textController.selection = TextSelection.fromPosition(
                  TextPosition(offset: textController.text.length),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 11),
            ),
            child: label is String
                ? Text(label, style: TextStyle(fontSize: 22))
                : const Icon(Icons.backspace_outlined, color: Colors.black, size: 18),
          ),
        ),
      );
    }

    // The tall Transfer button spanning 3 rows
    Widget _buildTransferButton() {
      return Container(
        margin: EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: () {
            phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
            LoadingDialog loadingDialog = Get.put(LoadingDialog());
            loadingDialog.showLoadingDialog();
            Future.delayed(Duration(milliseconds: 500), () {
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
                                Text("Transfer to Bank", style: TextStyle(fontSize: 17, color: Colors.black87)),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Obx(() =>
                                    Text.rich(
                                      TextSpan(
                                        text: '${NumberFormat('#,###').format(phoneNumberinpController.bankAmount.value)}.00',
                                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: "ETB",
                                            style: TextStyle(fontSize: 16, color: Colors.black),
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
                                              Text("Original Amount", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                              Text("${phoneNumberinpController.originalBankAmount}.00ETB", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Service fee", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                              Text(phoneNumberinpController.bankAmount < 101 ? "1.00" :
                                                phoneNumberinpController.bankAmount > 99 && phoneNumberinpController.bankAmount < 500 ? "3.00" :
                                                phoneNumberinpController.bankAmount >= 500 && phoneNumberinpController.bankAmount < 1000 ? "6.00" :
                                                phoneNumberinpController.bankAmount >= 1000 && phoneNumberinpController.bankAmount < 5000 ? "7.00" :
                                                "9.00",
                                               style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600))
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
                                          child: Text("Payment Method", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.account_balance_wallet, color: Color.fromARGB(255, 141, 197, 64), size: 24),
                                              SizedBox(width: 3),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Balance", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                                    Text("(Available Balance:9034.72ETB)", style: TextStyle(fontSize: 14, color: Colors.grey))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 80),
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
                                      Pin().show(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.85, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                    ),
                                    child: Text("Transfer", style: TextStyle(fontSize: 18))
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
          child: Text("Transfer", style: TextStyle(fontSize: 16)),
        ),
      );
    }

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: Image.asset('images/cbe.jpg', fit: BoxFit.cover),
                          ),
                          SizedBox(width: 7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${phoneNumberinpController.accountName == "BORA AMUSEMENT PARK EMEBET WOLDHER" ? "BORA AMUSEMENT PARK EMEB..." : phoneNumberinpController.accountName == "AMBASSADOR GARMENT AND TRADE PLC" ? "AMBASSADOR GARMENT AND TRA..." : phoneNumberinpController.accountName == "DARCO MANUFACTURING AND TRADING PLC" ? "DARCO MANUFACTURING AND TRA..." :  phoneNumberinpController.accountName == "EFFI NORDIC SPECIALIZED RESTAURANT" ? "EFFI NORDIC SPECIALIZED RES..." : phoneNumberinpController.accountName}", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: phoneNumberinpController.accountName == "AMBASSADOR GARMENT AND TRADE PLC" || phoneNumberinpController.accountName == "DARCO MANUFACTURING AND TRADING PLC" ? 16.5 : 18)),
                              Obx(() => Text("Commercial Bank of Ethiopia(${phoneNumberinpController.accountNumber})", style: TextStyle(color: const Color.fromARGB(255, 216, 215, 215), fontSize: 13)))
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
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                                        controller: textController..text,
                                        onChanged: (value) {
                                          phoneNumberinpController.setBankAmount(int.tryParse(value) ?? 0);
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
                                  _buildKey("1"),
                                  _buildKey("2"),
                                  _buildKey("3"),
                                ],
                              ),
                              // Row 2: 4, 5, 6
                              Row(
                                children: [
                                  _buildKey("4"),
                                  _buildKey("5"),
                                  _buildKey("6"),
                                ],
                              ),
                              // Row 3: 7, 8, 9
                              Row(
                                children: [
                                  _buildKey("7"),
                                  _buildKey("8"),
                                  _buildKey("9"),
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
                                          phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
                                          amount.value += "0";
                                          textController.text = amount.value;
                                          textController.selection = TextSelection.fromPosition(
                                            TextPosition(offset: textController.text.length),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                                          elevation: 0,
                                          padding: EdgeInsets.symmetric(vertical: 11),
                                        ),
                                        child: Text("0", style: TextStyle(fontSize: 22)),
                                      ),
                                    ),
                                  ),
                                  // dot
                                  _buildKey("."),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Right column: backspace (top) + Transfer (tall, spans 3 rows)
                        SizedBox(
                          width: (screenWidth - 14) / 4,
                          child: Column(
                            children: [
                              // Backspace button
                              Container(
                                margin: EdgeInsets.all(3),
                                child: ElevatedButton(
                                  onPressed: () {
                                    phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
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
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3), side: BorderSide.none),
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(vertical: 11),
                                    minimumSize: Size(double.infinity, 0),
                                  ),
                                  child: const Icon(Icons.backspace_outlined, color: Colors.black, size: 18),
                                ),
                              ),
                              // Transfer button — fills remaining height (rows 2, 3, 4)
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      phoneNumberinpController.setBankAmount(int.tryParse(textController.text) ?? 0);
                                      LoadingDialog loadingDialog = Get.put(LoadingDialog());
                                      loadingDialog.showLoadingDialog();
                                      Future.delayed(Duration(milliseconds: 500), () {
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
                                                          Text("Transfer to Bank", style: TextStyle(fontSize: 17, color: Colors.black87)),
                                                          Container(
                                                            padding: EdgeInsets.all(8),
                                                            child: Obx(() =>
                                                              Text.rich(
                                                                TextSpan(
                                                                  text: '${NumberFormat('#,###').format(phoneNumberinpController.bankAmount.value)}.00',
                                                                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black),
                                                                  children: [
                                                                    TextSpan(
                                                                      text: "ETB",
                                                                      style: TextStyle(fontSize: 16, color: Colors.black),
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
                                                                        Text("Original Amount", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                                                        Text("${phoneNumberinpController.originalBankAmount}.00ETB", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(8),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text("Service fee", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                                                        Text(phoneNumberinpController.bankAmount < 101 ? "1.00" :
                                                                          phoneNumberinpController.bankAmount > 99 && phoneNumberinpController.bankAmount < 500 ? "3.00" :
                                                                          phoneNumberinpController.bankAmount >= 500 && phoneNumberinpController.bankAmount < 1000 ? "6.00" :
                                                                          phoneNumberinpController.bankAmount >= 1000 && phoneNumberinpController.bankAmount < 5000 ? "7.00" :
                                                                          "9.00",
                                                                         style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600))
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
                                                                    child: Text("Payment Method", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                                                  ),
                                                                  Container(
                                                                    width: double.infinity,
                                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Icon(Icons.account_balance_wallet, color: Color.fromARGB(255, 141, 197, 64), size: 24),
                                                                        Container(
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("Balance", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                                                              Text("(Available Balance:9034.72ETB)", style: TextStyle(fontSize: 14, color: Colors.grey))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 80),
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
                                                                Pin().show(context);
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: Color.fromARGB(255, 141, 197, 64),
                                                                foregroundColor: Colors.white,
                                                                minimumSize: Size(screenWidth * 0.85, 50),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(8)
                                                                ),
                                                              ),
                                                              child: Text("Transfer", style: TextStyle(fontSize: 18))
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
                                    child: Text("Transfer", style: TextStyle(fontSize: 16)),
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
}
