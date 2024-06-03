import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/helper.dart';

class UpdatePriceWidget extends StatefulWidget {
  final String price;
  final void Function(dynamic value) onPriceUpdate;
  const UpdatePriceWidget({Key? key, required this.onPriceUpdate, required this.price}) : super(key: key);

  @override
  State<UpdatePriceWidget> createState() => _UpdatePriceWidgetState();
}

class _UpdatePriceWidgetState extends State<UpdatePriceWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      "ENTER NEW PRICE",
                      style: TextStyle(
                          color: isDarkMode(context) ? Colors.white : Colors.black,
                          fontSize: 28,
                          letterSpacing: 0.5,
                          fontFamily: 'Poppinssb'),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                "\$",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0XFF6FB52C),
                                    fontSize: 40,
                                    letterSpacing: 0.5,
                                    fontFamily: 'Poppinssb'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                border: InputBorder.none, // No border
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              onChanged: (value) {
                                String currentText = controller.text.replaceAll('.', '').padLeft(3, '0'); // Ensure at least three characters

                                if (currentText == '000') {
                                  controller.value = TextEditingValue(
                                    text: '0.00',
                                    selection: TextSelection.collapsed(offset: 4),
                                  );
                                } else {
                                  String newText = currentText.substring(0, currentText.length - 2) + '.' + currentText.substring(currentText.length - 2);
                                  // This removes unnecessary leading zeros
                                  if (newText.startsWith('0') && newText[1] != '.') {
                                    newText = newText.substring(1);
                                  }
                                  controller.value = TextEditingValue(
                                    text: newText,
                                    selection: TextSelection.collapsed(offset: newText.length),
                                  );
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,  // Ensure only numbers can be entered
                              ],
                              style: TextStyle(
                                  color: Color(0XFF6FB52C),
                                  fontSize: 64.0,
                                  letterSpacing: 0.5,
                                  fontFamily: 'Poppinsb'),
                            ),
                          )
                        ]
                      ),
                    ),
                  ]
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    widget.onPriceUpdate(controller.text);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 56.0, vertical: 56.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF70B62C),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [BoxShadow(color: Color(0XFF6FB52C).withAlpha(50), offset: Offset(0, 4), blurRadius: 20.0)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Confirm", style: const TextStyle(fontFamily: "Poppinsm", color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
