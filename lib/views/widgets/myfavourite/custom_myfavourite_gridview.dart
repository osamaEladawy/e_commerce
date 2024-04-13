import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/options/myfavourite_controller.dart';
import '../../../core/constant/assetsImages.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/myfavourite_modek.dart';

class CustomMyFavouriteGridView extends GetView<MyFavoritesController> {
  final MyFavouriteModel myFavouriteModel;
  //final ItemsModel itemsModel;

  const CustomMyFavouriteGridView({super.key, required this.myFavouriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         //controller.goToDetailsProduct(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              Hero(
                tag: "${myFavouriteModel.itemsId}",
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                  imageUrl:
                      "${AssetsImages.imageItems}/${myFavouriteModel.itemsImages!}",
                  height: Get.width /4.2,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height:15),
              Text(
                "${translateDatabase(myFavouriteModel.itemsNameAr, myFavouriteModel.itemsName)}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      "${myFavouriteModel.itemsDesc}",
                      style:const TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const Spacer(),
                  IconButton(
                    onPressed: () {
                      controller.deleteDataFromFavourite(myFavouriteModel.favouriteId!);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
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
