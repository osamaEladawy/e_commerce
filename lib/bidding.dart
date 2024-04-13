import 'package:get/get.dart';

import 'core/class/curd.dart';

class MyBidding extends Bindings{
  @override
  void dependencies() {
    Get.put(Curd());
  }

}