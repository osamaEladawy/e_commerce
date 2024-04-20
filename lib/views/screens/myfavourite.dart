import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/options/myfavourite_controller.dart';
import '../../core/class/handlingdata_view.dart';
import '../widgets/myfavourite/custom_myfavourite_gridview.dart';
import '../widgets/myfavourite/search.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritesController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<MyFavoritesController>(
          builder: (controller) => ListView(
            children: [
              CustomTextFieldScreenFavourite(
                keyForm: controller.formState,
                controller: controller.controller,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconSearch: () {
                  controller.search();
                },
                hintText: 'Enter your product',
                label: 'Product',
              ),
              const SizedBox(
                height: 10,
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.70),
                    itemBuilder: (context, index) {
                      return CustomMyFavouriteGridView(
                        myFavouriteModel: controller.data[index], //itemsModel: null,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
