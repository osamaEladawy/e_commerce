import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/options/offers_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../home/home.dart';
import '../widgets/offers/customcard_offers.dart';
import '../widgets/offers/customsearch.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("offers"),
      ),
      body: GetBuilder<OffersControllerImp>(
        builder: (controller) =>Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              CustomTextFieldScreenOffers(
                keyForm: controller.formState,
                controller: controller.controller,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconSearch: () {
                  controller.search();
                },
                onPressedFavourite: () {
                  controller.goToFavourite();
                },
                hintText: 'Enter your product',
                label: 'Product',
              ),
              const SizedBox(
                height: 10,
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? ItemsListModel(
                  listOfModels: controller.listofmodel,
                ): ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CustomCardOffers(
                  itemsModel: controller.data[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
