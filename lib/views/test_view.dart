import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller.dart';
import '../core/class/handlingdata_view.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TextController());
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Show Data",style: Theme.of(context).textTheme.headline1,),
              const SizedBox(height: 15,),
              GetBuilder<TextController>(builder: (controller){
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      itemBuilder: (context,index){
                        return Text("${controller.data}");
                      }),);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
