import 'package:flutter/material.dart';

import '../../../services/helper.dart';

class CancelledBottomSheet extends StatefulWidget {
  final void Function() cancelOrder;
  const CancelledBottomSheet({Key? key, required this.cancelOrder}) : super(key: key);

  @override
  _CancelledBottomSheetState createState() => _CancelledBottomSheetState();
}

class _CancelledBottomSheetState extends State<CancelledBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.02),
            Center(
              child: Text("Cancel Order?",
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Poppinssb",
                    letterSpacing: 0.5,
                    fontSize: 24,
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  )),
            ),
            SizedBox(height: size.height * 0.04),
            Center(
              child: Image.asset("assets/icons/cancelled.png", height: size.height * 0.14, width: size.height * 0.14),
            ),
            SizedBox(height: size.height * 0.05),
          ]
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isDarkMode(context) ? Colors.black : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), offset: Offset(0, 4), blurRadius: 20.0
              )
            ]
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.cancelOrder();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.all(12.0),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF70B62C),
                    borderRadius: BorderRadius.circular(12.0),
                    // boxShadow: [BoxShadow(color: Color(COLOR_PRIMARY).withAlpha(50), offset: Offset(0, 4), blurRadius: 20.0)]
                  ),
                  child: Text("Yes, Cancel", textAlign: TextAlign.center, style: const TextStyle(fontFamily: "Poppinsm", color: Colors.white, fontSize: 16)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF70B62C)),
                    borderRadius: BorderRadius.circular(12.0),
                    // boxShadow: [BoxShadow(color: Color(COLOR_PRIMARY).withAlpha(50), offset: Offset(0, 4), blurRadius: 20.0)]
                  ),
                  child: Text("No, Close", textAlign: TextAlign.center, style: const TextStyle(fontFamily: "Poppinsm", color: Color(0xFF70B62C), fontSize: 16)),
                ),
              )
            ]
          ),
        )
      ],
    );
  }
}
