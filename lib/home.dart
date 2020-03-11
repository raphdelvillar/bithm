import 'package:flutter/material.dart';

import 'package:bithm/view/interest.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 1, vsync: this);
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
                  value: false,
                  onChanged: (bool value) {
                    print("test");
                  }
                ),
                Text(
                  "Filipino",
                  style: TextStyle(fontSize: 15)
                ),
              ],
            );
          }
        ),
        backgroundColor: Colors.blue,
      ),
      body: Interest()
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