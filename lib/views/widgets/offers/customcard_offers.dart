import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/options/favourite_controller.dart';
import '../../../controller/options/offers_controller.dart';
import '../../../core/constant/assetsImages.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/items_model.dart';

class CustomCardOffers extends GetView<OffersControllerImp> {
  final ItemsModel itemsModel;

  const CustomCardOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
     Get.put(FavouriteController());
    return InkWell(
      onTap: () {
        controller.goToDetiales(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(
                        "${itemsModel.itemsDesc}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
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
                         Text(
                              "${itemsModel.itemsPriceDiscount}\$",
                              style: const TextStyle(fontSize: 17),
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
                  right: -37,
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
