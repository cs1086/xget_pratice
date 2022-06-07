import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xget_pratice/count/count.dart';
class MyWidget extends StatelessWidget {
  MyWidget({Key? key,}) : super(key: key);
  final CountController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    // return Container(child: GetBuilder<CountController>(
    //     builder: (_) => Text(
    //       'clicks: ${ctrl.count}',
    //     )),);
    return Container(child: Obx(()=>Text(
      'clicks: ${ctrl.count}',
    ),),);
  }
}
