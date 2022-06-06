import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return ElevatedButton(
      child: Container(
        child: Text('/third'),
      ),
      onPressed: () {
        Get.back(result: 'from third');
      },
    );
  }
}
