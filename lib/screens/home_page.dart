import 'package:flutter/material.dart';
import 'package:form_project/constants/string_constants.dart';

class ScrollViewPage extends StatefulWidget {
  const ScrollViewPage({super.key});

  @override
  State<ScrollViewPage> createState() => _ScrollViewPageState();
}

class _ScrollViewPageState extends State<ScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          StringConstants.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
          flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10,right: 5),
                padding: const EdgeInsets.all(15),
                // width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const SingleChildScrollView(
                    child: Text(
                  StringConstants.paragraph,
                  style: TextStyle(color: Colors.white),
                ))),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 5, bottom: 10, top: 10,right: 10),
                padding: const EdgeInsets.all(15),
                // width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const SingleChildScrollView(
                    child: Text(
                  StringConstants.paragraph,
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        ],
      ),
    );
  }
}
