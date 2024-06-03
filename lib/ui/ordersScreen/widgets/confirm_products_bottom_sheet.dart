import 'package:flutter/material.dart';
import 'package:foodie_restaurant/model/OrderModel.dart';

class ConfirmProductsBottomSheet extends StatefulWidget {
  OrderModel orderModel;
  void Function(OrderModel orderModel) onConfirm;
  ConfirmProductsBottomSheet(
      {super.key, required this.orderModel, required this.onConfirm});

  @override
  State<ConfirmProductsBottomSheet> createState() =>
      _ConfirmProductsBottomSheetState();
}

class _ConfirmProductsBottomSheetState
    extends State<ConfirmProductsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/icons/close_square.png',
                          width: 30, height: 30, color: Colors.black),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Text('Select available products',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "Poppinssb",
                        letterSpacing: 0.5,
                        fontSize: 22,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 28),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.orderModel.orderProduct.length,
                      // itemCount: 7,
                      itemBuilder: (context, index) {
                        final items = widget.orderModel.orderProduct[index];
                        return Column(children: [
                          Row(
                            children: [
                              Checkbox(
                                value: items.delivered,
                                onChanged: (bool? value) {
                                  setState(() {
                                    items.delivered = value!;
                                  });
                                },
                              ),
                              Text(items.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0XFF555353),
                                      fontFamily: 'Poppinsr')),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 16),
                              Text('Total Quantity:  ${items.quantity}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0XFF555353),
                                      fontFamily: 'Poppinsr')),
                              const SizedBox(width: 16),
                              Text('Available: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0XFF555353),
                                      fontFamily: 'Poppinsr')),
                              const SizedBox(width: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (items.availableQuantity > 1) {
                                        items.availableQuantity -= 1;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFD9D9D9)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Image.asset(
                                          'assets/icons/minus.png',
                                          color: Color(0xFFD9D9D9),
                                          height: 18,
                                          width: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    width: 24,
                                    child: Text(
                                      items.availableQuantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0XFF555353),
                                          fontFamily: "Poppinsm"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (items.availableQuantity <
                                          items.quantity) {
                                        items.availableQuantity += 1;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFD9D9D9)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Image.asset('assets/icons/add.png',
                                          color: Color(0xFF70B62C),
                                          height: 20,
                                          width: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ]);
                      }),
                  const SizedBox(height: 64),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              widget.onConfirm(widget.orderModel);
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color(0xFF70B62C),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Complete",
                      style: const TextStyle(
                          fontFamily: "Poppinsm",
                          color: Colors.white,
                          fontSize: 16)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
