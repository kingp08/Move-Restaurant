import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../services/helper.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 50.0;
}

class AddOptionView extends StatefulWidget {

  String? title, description;
  String? max;
  bool? optionDefault;

  Function onDone;

  AddOptionView({required this.onDone, this.title, this.description, this.max, this.optionDefault});

  @override
  State<AddOptionView> createState() => _AddOptionViewState();
}

class _AddOptionViewState extends State<AddOptionView> {

  String? title, description;
  String? max;
  bool optionDefault = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.title != "") {
      titleController.text = widget.title ?? "";
      maxController.text = widget.max ?? "";
      descriptionController.text = widget.description ?? "";
      optionDefault = widget.optionDefault ?? false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    final mLogo = Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: Container(
        height: 84,
        margin: EdgeInsets.only(top: 14),
        color: Colors.transparent,
        child: Center(
          child: Image.asset("assets/images/app_logo.png"),
        ),
      ),
    );

    final bottomRow = Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  // primary: Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.transparent,
                  // onSurface: Colors.grey,
                  padding: EdgeInsets.all(0.0),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: isDarkMode(context) ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              height: 45,
              child: TextButton(
                onPressed: () {
                  widget.onDone(optionDefault, title, max, description);

                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  // primary: Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color(COLOR_PRIMARY),
                  // onSurface: Colors.grey,
                  padding: EdgeInsets.all(0.0),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
                child: Text(
                  "Add",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );

    final mBody = Container(
      padding: EdgeInsets.only(
        top: Consts.avatarRadius + Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade50,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            TextFormField(
              controller: titleController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              onSaved: (val) => title = val,
              onChanged: (value) {
                title = value;
              },
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(fontSize: 18.0),
              cursorColor: Color(COLOR_PRIMARY),
              validator: validateEmptyField,
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.only(left: 8, right: 8),
                hintText: 'Option Name',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0), borderSide: BorderSide(color: Color(COLOR_PRIMARY), width: 2.0)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: maxController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.done,
              // onSaved: (val) => max = val,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                max = value;
              },
              // textCapitalization: TextCapitalization.words,
              style: TextStyle(fontSize: 18.0),
              cursorColor: Color(COLOR_PRIMARY),
              validator: validateEmptyField,
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.only(left: 8, right: 8),
                hintText: 'Option Price',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0), borderSide: BorderSide(color: Color(COLOR_PRIMARY), width: 2.0)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              // onSaved: (val) => title = val,
              onChanged: (value) {
                description = value;
              },
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(fontSize: 18.0),
              cursorColor: Color(COLOR_PRIMARY),
              validator: validateEmptyField,
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.only(left: 8, right: 8),
                hintText: 'Description',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0), borderSide: BorderSide(color: Color(COLOR_PRIMARY), width: 2.0)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Default",
                  style: const TextStyle(fontFamily: 'Poppinsm', color: Color(0XFF2A2A2A), fontSize: 15),
                ),
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Checkbox(value: optionDefault, activeColor: Color(COLOR_PRIMARY), onChanged: (value) {
                    setState(() {
                      optionDefault = value!;
                    });
                  }),
                )
              ],
            ),
            SizedBox(height: 15),
            bottomRow
          ],
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        mBody,
        mLogo,
      ],
    );
  }
}