import 'package:flutter/material.dart';

import 'package:bithm/helper/translator.dart';

class Interest extends StatefulWidget {
  final String language;

  Interest({Key key, @required this.language}) : super(key : key);

  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final Translator translator = Translator();

  double loanedAmount = 0.00;
  double payableAmount = 0.00;
  double payableAmountPerDay = 0.00;
  double incomeAmount = 0.00;
  double incomeAmountPerDay = 0.00;

  double amount = 0;
  double interest = 0;
  double days = 0;

  @override
  void initState() {
    super.initState();
  }

  _setValues(double amountVal, double interestVal, double daysVal) {
    if (amountVal != null) {
      amount = amountVal;
    }

    if (interestVal != null) {
      interest = interestVal;
    }

    if (daysVal != null) {
      days = daysVal;
    }

    _compute();
  }

  _compute() {
    if (days == 0) {
      days = 1;
    }
    double amountPerDay = amount / days;
    payableAmount = amount + (amount * (interest / 100));
    payableAmountPerDay = amountPerDay + (amountPerDay * (interest / 100));
    incomeAmount = amount * (interest / 100);
    incomeAmountPerDay = amountPerDay * (interest / 100);
    
    setState(() {
      loanedAmount = amount;
      payableAmount = payableAmount;
      payableAmountPerDay = payableAmountPerDay;
      incomeAmount = incomeAmount;
      incomeAmountPerDay = incomeAmountPerDay;
    });
  }

  String _translate(String value) {
    return translator.translate(widget.language, value);
  }


  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Text(_translate("Interest Calculator"), style: TextStyle(fontSize:  20))
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: _translate("Amount"),
            hintText: _translate("Amount")
          ),
          keyboardType: TextInputType.number,
          onChanged: (amount) {
            _setValues(double.parse(amount), null, null);
          }
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: _translate("Interest Rate (in %)"),
            hintText: _translate("Interest Rate (in %)")
          ),
          keyboardType: TextInputType.number,
          onChanged: (interest) {
            _setValues(null, double.parse(interest), null);
          }
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: _translate("How many days?"),
            hintText: _translate("How many days?")
          ),
          keyboardType: TextInputType.number,
          onChanged: (days) {
            _setValues(null, null, double.parse(days));
          }
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Divider()
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Text(_translate("Result"), style: TextStyle(fontSize:  20))
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_translate("Loaned Amount"), style: TextStyle(fontSize: 16)),
            Text(loanedAmount.toString(), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_translate("Payable Amount"), style: TextStyle(fontSize: 16)),
            Text(payableAmount.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_translate("Payable per day"), style: TextStyle(fontSize: 16)),
            Text(payableAmountPerDay.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_translate("Income"), style: TextStyle(fontSize: 16)),
            Text(incomeAmount.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.green))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_translate("Income per day"), style: TextStyle(fontSize: 16)),
            Text(incomeAmountPerDay.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.green))
          ]
        )
      )
    ]);
  }
}