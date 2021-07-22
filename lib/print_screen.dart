import 'dart:io' show Platform;

import 'package:bitcon_ticker_changle_app/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrentcy = 'USD';

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropdownItem = [];
    for (String currency in currentciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItem.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrentcy,
      items: dropdownItem,
      onChanged: (value) {
        setState(() {
          selectedCurrentcy = value!;
        });
      },
    );
  }

  CupertinoPicker iospicker() {
    List<Text> pickerItem = [];
    for (String currency in currentciesList) {
      pickerItem.add(Text(currency));
    }
    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectTedIndex) {
          print(selectTedIndex);
        },
        children: pickerItem);
  }

  @override
  void initState() {
    //todo: call getdata
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🧡🧡 Coin Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18.0),
            child: Card(
              color: Colors.lightBlue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  //update text widget
                  " 1btc= ? Usd",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iospicker() : androidDropDown()),
        ],
      ),
    );
  }
}
