import 'package:e_commerce_app/core/class/handlingdata_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address/completeinfo_controller.dart';
import '../widgets/addrees/customButton_address.dart';
import '../widgets/addrees/testfield_address.dart';

class CompleteInfoAdress extends StatelessWidget {
  const CompleteInfoAdress({super.key});

  @override
  Widget build(BuildContext context) {

     Get.put(CompleteInfoControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Info"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<CompleteInfoControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formState,
              child: Column(
                children: [
                  CustomTextFieldAddress(
                    controller: controller.name,
                    hintText: 'Enter your nameAddress',
                    suffixIcon: const Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.red,
                    ),
                    label: const Text("name"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldAddress(
                    controller: controller.city,
                    hintText: 'Enter your city',
                    suffixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.green,
                    ),
                    label: const Text("city"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldAddress(
                    controller: controller.street,
                    hintText: 'Enter your street',
                    suffixIcon: const Icon(
                      Icons.streetview,
                      color: Colors.grey,
                    ),
                    label: const Text("street"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonAddress(
                    text: const Text("Save",style: TextStyle(
                      color: Colors.white
                    ),),
                    onPressed: () {
                      controller.addData();
                    },
                    color: Colors.orange,
                    backgroundColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
