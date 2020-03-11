import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
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
      _compute();
    }

    if (interestVal != null) {
      interest = interestVal;
      _compute();
    }

    if (daysVal != null) {
      days = daysVal;
      _compute();
    }
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

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Text("Interest Calculator", style: TextStyle(fontSize:  20))
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
            labelText: "Amount",
            hintText: "Amount"
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
            labelText: "Interest Rate (in %)",
            hintText: "Interest Rate (in %)"
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
            labelText: "How many days?",
            hintText: "How many days?"
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
        child: Text("Result", style: TextStyle(fontSize:  20))
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Loaned Amount", style: TextStyle(fontSize: 16)),
            Text(loanedAmount.toString(), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payable Amount", style: TextStyle(fontSize: 16)),
            Text(payableAmount.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payable per day", style: TextStyle(fontSize: 16)),
            Text(payableAmountPerDay.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.red))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Income", style: TextStyle(fontSize: 16)),
            Text(incomeAmount.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.green))
          ]
        )
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Income per day", style: TextStyle(fontSize: 16)),
            Text(incomeAmountPerDay.toStringAsFixed(2), style: TextStyle(fontSize: 16, color: Colors.green))
          ]
        )
      )
    ]);
  }
}