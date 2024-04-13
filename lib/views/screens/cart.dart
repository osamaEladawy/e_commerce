import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/options/cart_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/translate_database.dart';
import '../widgets/cart/custom_card_cart.dart';
import '../widgets/cart/navigationbotom_cart.dart';
import '../widgets/cart/title _cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CratControllerImp controllerImp = Get.put(CratControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:const Text("MyCart"),
        leading: IconButton(
          onPressed: () {
            controllerImp.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<CratControllerImp>(
        builder: (controller1) => CustomNavigationBarCart(              
          apply: () {
            controller1.copon();
          },
          discount: "${controller1.copondiscount}",
          coponController: controller1.nameCopon,
          formatKey: controller1.formState,
          onPressed: () {
            controller1.goToCheckOut();
          },
          price: "${controller1.responsePrice}",
          shaping: '10',
          totalPrice: "${controller1.getTotalPrice()}",
        ),
      ),
      body: GetBuilder<CratControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomTitleCart(
                message: "You have a ${controller.responseCount} From products",
              ),
              ...List.generate(
                controller.datacart.length,
                (index) => CustomCardCart(
                  onAdd: () async {
                    await controller
                        .addCart(controller.datacart[index].itemsId!);
                    controller.refreshData();
                  },
                  onRemove: () async {
                    await controller
                        .removeCart(controller.datacart[index].itemsId!);
                    controller.refreshData();
                  },
                  count: '${controller.datacart[index].itemscount}',
                  price: '${controller.datacart[index].itemsPriceDiscount}',
                  name:
                      '${translateDatabase(controller.datacart[index].itemsNameAr, controller.datacart[index].itemsName)}',
                  url: '${controller.datacart[index].itemsImages}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
