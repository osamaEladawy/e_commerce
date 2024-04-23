import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_items_controller/itemadetiales_controller.dart';
import '../../../core/constant/assetsImages.dart';

class CustomTop extends GetView<ItemsDetailsControllerImp> {
  const CustomTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration:const BoxDecoration(
            color:
            //Color(0xff192a56),
            Color(0xff273c75),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),),
          ),
        ),
        Positioned(
          top: 50.0,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
              "${AssetsImages.imageItems}/${controller.itemsModel.itemsImages}",
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
