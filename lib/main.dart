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

// ✅ Create a Controller for State Management
class CounterController extends GetxController {
  var index = 0.obs;

  void increment() => index++;
  void decrement() {
    if (index > 0) index--; // Prevent negative values
  }
}

// ✅ Use the Controller in UI
class Counter extends StatelessWidget {
  Counter({super.key});

  // GetX automatically stores this controller
  final CounterController controller = Get.put(CounterController());

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
                "${controller.index}",
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
            onPressed: controller.decrement,
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            onPressed: controller.increment,
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
