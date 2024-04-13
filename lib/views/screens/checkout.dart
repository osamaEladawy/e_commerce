import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/options/checkout_controller.dart';
import '../widgets/checkout/custom_card.dart';
import '../widgets/checkout/custom_paymeny_method.dart';
import '../widgets/checkout/custom_title.dart';
import '../widgets/checkout/customcontianer_image.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key}); 

  @override
  Widget build(BuildContext context) {
    CheekOutControllerImp controller = Get.put(CheekOutControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: MaterialButton(
          onPressed: () {
            controller.checkOut();
          },
          color: Colors.red,
          child: Text("Check out",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.white,
                  )),
        ),
      ),
      appBar: AppBar(
        title: const Text("Check out"),
        leading: IconButton(
          onPressed: () {
            controller.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: GetBuilder<CheekOutControllerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const CustomTitle(
                title: "Choose Payment Method",
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async{
                  controller.paymetMethods("0"); // 0 => cash
                },
                child: CustomPayment(
                    isPayment: controller.payment == "0" ? true : false,
                    title: "Cash"),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  controller.paymetMethods("1"); // 1 => cards
                },
                child: CustomPayment(
                    isPayment: controller.payment == "1" ? true : false,
                    title: "Payment Cards"),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTitle(
                title: "Choose Orders Type",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.chooseDeliveryType("0"); // 0=> delivery
                    },
                    child: CustomContianerImage(
                      isColor: controller.ordertype == "0" ? true : false,
                      urlImage: "assets/images/delivery.png",
                      title: "Delivery",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.chooseDeliveryType("1"); // 1=> receive
                    },
                    child: CustomContianerImage(
                      isColor: controller.ordertype == "1" ? true : false,
                      urlImage: "assets/images/car.png",
                      title: "CarTrue",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.ordertype == "0")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.models.isNotEmpty
                        ? const CustomTitle(
                            title: "Choose Address Type",
                          )
                        : InkWell(
                            onTap: () {
                              controller.goToAddress();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child:const  Text(
                                "please Enter your address \n Cleck here",
                                textAlign: TextAlign.center,style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                              ),
                            ),
                          ),
                    ...List.generate(
                      controller.models.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.chooseAddress(
                              controller.models[index].addressId!);
                        },
                        child: CustomCardChoose(
                          ischeck: controller.addressId ==
                                  controller.models[index].addressId
                              ? true
                              : false,
                          title: "${controller.models[index].addressName}",
                          content:
                              "${controller.models[index].addressCity}/${controller.models[index].addressStreet}",
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
