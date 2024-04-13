import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/all_home_controller/homepage_controller.dart';
import '../../controller/options/myfavourite_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../../core/constant/assetsImages.dart';
import '../../core/functions/translate_database.dart';
import '../../data/model/items_model.dart';
import '../widgets/home_screen/custom_card.dart';
import '../widgets/home_screen/custom_items_list.dart';
import '../widgets/home_screen/custom_ttextfield_screenhome.dart';
import '../widgets/home_screen/customoffershome.dart';
import '../widgets/home_screen/listview_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controllerImp = Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextFieldScreenHome(
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
                onPressedNotification: () {
                  controller.notification();
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
                        listOfModels: controller.listOfModel,
                      )
                    : ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          CustomCard(
                            text1: controllerImp.title,
                            text2: controllerImp.body,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Categories",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const CustomCategories(),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Top Sales",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CutsomListItems(),
                          Text(
                            "Offers",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) => CustomOffersHome(
                                  itemsModel: controller.data[index]),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsListModel extends GetView<HomePageControllerImp> {
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
            onTap: () {
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
