import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Counter());
  }
}

class Counter extends StatelessWidget {
  Counter({super.key});
  var index = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap + to increase, Tap - to decrease",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Obx(
              () => Text(
                "$index",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (index > 0) index--; //prevent negative values
            },
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            onPressed: () {
              index++;
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
