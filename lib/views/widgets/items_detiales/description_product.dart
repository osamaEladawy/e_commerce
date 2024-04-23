import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_items_controller/itemadetiales_controller.dart';
import '../../../core/functions/translate_database.dart';

class CustomDescriptionProduct extends GetView<ItemsDetailsControllerImp> {
  const CustomDescriptionProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
         Text(
            "${translateDatabase(controller.itemsModel.itemsDescAr,
                controller.itemsModel.itemsDesc)}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
