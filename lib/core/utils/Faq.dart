import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isSelect = false;
  List<Widget> _displayWidgets() => [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("  1. What is AIASCS")],
              ),
              Visibility(visible: isSelect, child: Text("am good"))
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("  2. What is AIASCS")],
              ),
              Visibility(visible: isSelect, child: Text("am good"))
            ],
          ),
        )
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: _displayWidgets().map((Widget display) {
            isSelect = false;
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelect = !isSelect;
                });
              },
              child: display,
            );
          }).toList(),
        ),
      ),
    );
  }
}
