import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_home_controller/homepage_controller.dart';
import '../../../core/constant/assetsImages.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class CutsomListItems extends GetView<HomePageControllerImp> {
  const CutsomListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]), val: index,
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;
  final int val;
  const Items({super.key, required this.itemsModel, required this.val});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.gotoProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.grey),
              child: CachedNetworkImage(
                imageUrl: "${AssetsImages.imageItems}/${itemsModel.itemsImages}",
                height: 160,
                width: 250,
                fit: BoxFit.fill,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 160,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
