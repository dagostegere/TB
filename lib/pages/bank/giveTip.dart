import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiveTipPage extends StatefulWidget {
  const GiveTipPage({super.key});

  @override
  State<GiveTipPage> createState() => _GiveTipPageState();
}

class _GiveTipPageState extends State<GiveTipPage> {
  final Color primaryGreen = const Color(0xFF8CC63F);

  final List<double> _denominations = [5.00, 10.00, 15.00, 20.00, 30.00];
  double? _selectedDenomination;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Give Tip',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GIVE TO LABEL
                    const Text(
                      'Give To',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // CHOOSE RECEIVER + PHONE NUMBER ROW
                    Row(
                      children: [
                        // Choose Receiver button
                        Container(
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Text(
                              'Choose Receiver',
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Phone number input
                        Expanded(
                          child: Container(
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Phone Number',
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.5,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 14)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Icon(
                                    Icons.contact_page_outlined,
                                    color: primaryGreen,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // DENOMINATION CARD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select denomination to tip the operator',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 14),

                          // RADIO BUTTONS GRID
                          Wrap(
                            spacing: 0,
                            runSpacing: 4,
                            children: _denominations.map((amount) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 3 - 24,
                                child: Row(
                                  children: [
                                    Radio<double>(
                                      value: amount,
                                      groupValue: _selectedDenomination,
                                      activeColor: primaryGreen,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedDenomination = val;
                                          _amountController.clear();
                                        });
                                      },
                                    ),
                                    Text(
                                      '${amount.toStringAsFixed(2)} ETB',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 16),

                          // OTHER AMOUNTS LABEL
                          const Text(
                            'Other Amounts',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // AMOUNT INPUT
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _amountController,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        setState(() => _selectedDenomination = null);
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Amount',
                                      hintStyle: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 14,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 14),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 14),
                                  child: Text(
                                    'ETB',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CONFIRM BUTTON
      Container(
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child:             
          Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
        ),
            const SizedBox(height: 58),
          ],
        ),
      ),
    );
  }
}