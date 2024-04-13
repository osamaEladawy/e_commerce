import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/all_items_controller/itemadetiales_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/functions/translate_database.dart';
import '../widgets/items_detiales/bottombar_product.dart';
import '../widgets/items_detiales/card_colors.dart';
import '../widgets/items_detiales/customrow_price.dart';
import '../widgets/items_detiales/customtproduct_top.dart';
import '../widgets/items_detiales/description_product.dart';
import '../widgets/items_detiales/name_product.dart';

TextStyle style = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle style1 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetialescontrollerImp controller = Get.put(ItemsDetialescontrollerImp());
    return Scaffold(
      bottomNavigationBar:  CustomBottomBar(
        title: "Go to Cart",
        onTap: () {
        controller.goToCart();
        },),
      body: SafeArea(
        child: GetBuilder<ItemsDetialescontrollerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const CustomTop(),
                const SizedBox(
                  height: 60,
                ),
                TitleProduct(name: "  ${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}  "),
                const SizedBox(
                  height: 20,
                ),
                CustomPrice(
                  count: controller.count,
                  price: '${controller.itemsModel.itemsPriceDiscount}\$',
                  onAdd: () {
                 controller.add();
                  },
                  onRemove: () {
                 controller.remove();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDescriptionProduct(),
                const SizedBox(
                  height: 20,
                ),
                const CustomCardColors(), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
