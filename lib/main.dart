import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xget_pratice/common/api/member_data.dart';
import 'package:xget_pratice/count/count.dart';
import 'package:xget_pratice/my_widget.dart';
import 'package:xget_pratice/second.dart';
import 'package:xget_pratice/third.dart';

import 'common/ui/my_widget.dart';

void main() => runApp(GetMaterialApp(
      home: Home(),
      initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => Home()),
      //   GetPage(name: '/second', page: () => Second()),
      //   GetPage(
      //       name: '/third', page: () => Third(), transition: Transition.zoom),
      // ],
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          binding: BindingsBuilder(() {
            Get.lazyPut<CountController>(() => CountController());//lazyPut只有使用時才會正式建立
          }),
        ),
        GetPage(
          name: '/second',
          page: () => Second(),
          binding: BindingsBuilder(() {
            Get.lazyPut<CountController>(() => CountController());
            Get.put<MemberData>(MemberData());//依賴注入這個類別來使用
          }),
        ),
        GetPage(
          name: '/third',
          page: () => Third(),
          binding: BindingsBuilder(() {
            Get.lazyPut<CountController>(() => CountController());
          }),
        ),
      ],
    ));

class Home extends StatelessWidget {
  final controller = Get.put(CountController());
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
          title: GetBuilder<CountController>(
              builder: (_) => Text(
                    'clicks: ${controller.count}',
                  ))),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CountController>(
                builder: (_) => Text(
                      'clicks: ${controller.count}',
                    )),
            MyWidget(),
            MyButton1(onPressed: () async {
              var a =
                  await Get.toNamed('/second', arguments: 'Get is the best');
              print(a);
            }),
            TextButton(
              child: Text('textButtonWithStyle'),
              onPressed: () {
                Get.toNamed('/third', arguments: 'Get is the best')
                    ?.then((value) => print(value));
              },
              style: TextButton.styleFrom(
                primary: Colors.purple,
                textStyle: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => controller.increment(),
      ));
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("王"),),
//         body: Center(
//           child: Text(_count.toString(),style: TextStyle(fontSize: 40.0),),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () => setState((){_count++;}),
//         ));
//   }
// }

//
// class Home extends StatelessWidget {
//   final controller = Get.put(Controller());
//   @override
//   Widget build(context) => Scaffold(
//       appBar: AppBar(title: Text("counter")),
//       body: Center(
//         child: MyWidget(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => controller.increment(),
//       )
//   );
// }
// class MyWidget extends StatelessWidget {
//   final Controller ctrl = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: GetBuilder<Controller>(
//         builder: (_) => Text(
//           'clicks: ${ctrl.count}',
//         )),);
//   }
// }
