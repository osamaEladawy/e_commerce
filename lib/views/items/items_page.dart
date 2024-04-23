import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/all_items_controller/items_controller.dart';
import '../../controller/options/favourite_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/assetsImages.dart';
import '../../core/functions/translate_database.dart';
import '../../data/model/items_model.dart';
import '../widgets/home_screen/custom_ttextfield_screenhome.dart';
import '../widgets/items/gridview_items.dart';
import '../widgets/items/listview_categories.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
   ItemsControllerImp controller=Get.put(ItemsControllerImp());
    FavouriteController controllerFav = Get.put(FavouriteController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CustomTextFieldScreenHome(
                keyForm: controller.formState,
                controller: controller.searchController,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconSearch: () {
                  controller.search();
                },
                onPressedFavourite: () {
                  controller.goToFavourite();
                },
                onPressedNotification: () {
                  controller.goToNotification();
                },
                hintText: 'Enter your product',
                label: 'Product',
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomItems(),
              GetBuilder<ItemsControllerImp>(
                builder: (controller) =>
                   HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch ? ItemsListModel(listOfModels: controller.listOfModel,) : GridView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                       childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                 controllerFav.isFavourite[controller.data[index]["items_id"]] = controller.data[index]["favourite"] ;
                        return ItemsGridView(
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index]),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsListModel extends GetView<ItemsControllerImp> {
  final List<ItemsModel> listOfModels;

  const ItemsListModel({super.key, required this.listOfModels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listOfModels.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              controller.gotoProductDetails(listOfModels[index]);
            },
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl:
                      "${AssetsImages.imageItems}/${listOfModels[index].itemsImages}",
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                          "${translateDatabase(listOfModels[index].itemsNameAr, listOfModels[index].itemsName)}"),
                      subtitle: Text(
                          "${translateDatabase(listOfModels[index].categoriesNameAr, listOfModels[index].categoriesName)}"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

