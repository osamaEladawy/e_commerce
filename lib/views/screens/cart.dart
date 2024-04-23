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
    CartControllerImp controllerImp = Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyCart"),
        leading: IconButton(
          onPressed: () {
            controllerImp.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller1) => CustomNavigationBarCart(
          apply: () {
            controller1.coupon();
          },
          discount: "${controller1.couponDiscount}",
          coponController: controller1.nameCoupon,
          formatKey: controller1.formState,
          onPressed: () {
            controller1.goToCheckOut();
          },
          price: "${controller1.responsePrice}",
          shaping: '10',
          totalPrice: "${controller1.getTotalPrice()}",
        ),
      ),
      body: GetBuilder<CartControllerImp>(
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
                controller.dataCart.length,
                (index) => CustomCardCart(
                  onAdd: () async {
                    await controller
                        .addCart(controller.dataCart[index].itemsId!);
                    controller.refreshData();
                  },
                  onRemove: () async {
                    await controller
                        .removeCart(controller.dataCart[index].itemsId!);
                    controller.refreshData();
                  },
                  count: '${controller.dataCart[index].itemscount}',
                  price: '${controller.dataCart[index].itemsPriceDiscount}',
                  name:
                      '${translateDatabase(controller.dataCart[index].itemsNameAr, controller.dataCart[index].itemsName)}',
                  url: '${controller.dataCart[index].itemsImages}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
