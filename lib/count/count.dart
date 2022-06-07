import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0;

  @override
  void onInit() {
    debounce(count, (_) => print("debouce$_"), time: Duration(seconds: 1));//用途停止改變變數1秒後觸發
  }

  void increment() {
    count++;
    update();
  }
}
