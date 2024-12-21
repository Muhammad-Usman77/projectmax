import 'package:flutter/material.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.blue,
          ),
          Expanded(
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Text(index.toString()  + ' =  usman');
                }),
          ),
          
        ],
      ),
    );
  }
}
