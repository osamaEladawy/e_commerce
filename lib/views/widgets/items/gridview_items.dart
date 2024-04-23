import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_items_controller/items_controller.dart';
import '../../../controller/options/favourite_controller.dart';
import '../../../core/constant/assetsImages.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class ItemsGridView extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const ItemsGridView({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Stack(
            children: [
              Column(
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      alignment: Alignment.center,
                      imageUrl:
                          "${AssetsImages.imageItems}/${itemsModel.itemsImages!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Row(
                        children: [
                         const Icon(Icons.alarm_rounded),
                          const SizedBox(width: 5,),
                          Text("${controller.services.preferences!.getString("deliverytime")} minutes")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (itemsModel.itemsDiscount != 0)
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            "${itemsModel.itemsPrice}\$",
                            style: const TextStyle(fontSize: 17),
                          ),
                          const Text(
                            "~~~~",textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${itemsModel.itemsPriceDiscount}\$",
                              style: const TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<FavouriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavourite[itemsModel.itemsId] ==
                                1) {
                              controller.setFavourite(itemsModel.itemsId, 0);
                              controller.removeFavourite(itemsModel.itemsId!);
                            } else {
                              controller.setFavourite(itemsModel.itemsId, 1);
                              controller.addFavourite(itemsModel.itemsId!);
                            }
                          }, 
                          icon: Icon(
                            controller.isFavourite[itemsModel.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (itemsModel.itemsDiscount != 0)
                Positioned(
                  right: -30,
                  top: -20,
                  child: Image.asset(
                    "assets/images/sale3.png",
                    height: 80,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
