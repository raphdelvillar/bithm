import 'package:flutter/material.dart';
import 'package:bithm/view/interest.dart';

import 'package:sprintf/sprintf.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, @required this.title}) : super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // TabController _controller;
  bool switchValue = false;
  String language = "English";

  @override
  void initState() {
    super.initState();
    // _controller = TabController(length: 1, vsync: this);
  }

  String _setTitle() {
    return sprintf("%s © %s", [widget.title, DateTime.now().year.toString()]);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                Text(
                  "English",
                  style: TextStyle(fontSize: 15)
                ),
                Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    if (value == true) {
                      language = "Tagalog";
                    } else {
                      language = "English";
                    }

                    setState(() {
                      switchValue = value;
                      language = language;
                    });
                  }
                ),
                Text(
                  "Tagalog",
                  style: TextStyle(fontSize: 15)
                ),
                Expanded(
                  child: Text(_setTitle(), textAlign: TextAlign.right)
                )
              ],
            );
          }
        ),
        backgroundColor: Colors.blue,
      ),
      body: Interest(language: language)
      // body: ListView(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         color: Colors.green[700]
      //       ),
      //       child: TabBar(
      //         controller: _controller,
      //         tabs: [
      //           Tab(
      //             icon: const Icon(Icons.trending_up),
      //             text: "Interest"
      //           ),
      //         ]
      //       )
      //     ),
      //     Container(
      //       height: 345,
      //       child: TabBarView(
      //         controller: _controller,
      //         children: <Widget>[
      //           Interest(),
      //         ]
      //       )
      //     )
      //   ]
      // )
    );
  }
}