import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/all_items_controller/itemadetiales_controller.dart';


class CustomCardColors extends GetView<ItemsDetialescontrollerImp> {
   const CustomCardColors({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "  Color",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: 15,),
        GetBuilder<ItemsDetialescontrollerImp>(
          builder:(controller)=> Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                controller.subItems.length,
                    (index) =>InkWell(
                      onTap: (){
                        controller.changeColors(index);
                      },
                      child:  Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: controller.indexColor == index ?const Color(0xff192a56) : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: const Color(0xff192a56))),
                  child: Text(
                    controller.subItems[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: controller.indexColor == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
               ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
