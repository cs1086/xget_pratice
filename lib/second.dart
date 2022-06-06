import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return ElevatedButton(
      child: Container(
        child: Text('/second'),
      ),
      onPressed: () {
        Get.back(result: 'from second');
      },
    );
  }
}
