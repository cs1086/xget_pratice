import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/api/member_data.dart';

class Second extends StatelessWidget {
  Second({Key? key}) : super(key: key);
  final MemberData memberData = Get.find();
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return ElevatedButton(
      child: Container(
        child: Text('memberData=${memberData.getData()}'),
      ),
      onPressed: () {
        Get.back(result: 'from second');
      },
    );
  }
}
