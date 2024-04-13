import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_items_controller/items_controller.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/categories_model.dart';


class CustomItems extends GetView<ItemsControllerImp> {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:60 ,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) {
          return Items(
            i: index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Items extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const Items({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding:const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: controller.selected == i
                    ? const Border(
                        bottom: BorderSide(color: Colors.red, width: 3),
                      )
                    : null,
              ),
              child: Text(
                "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
