import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/options/cart_controller.dart';
import '../../../core/constant/initialize_color.dart';
import '../../../core/constant/teststyle.dart';

TextStyle style = const TextStyle(
  fontSize: 15,
  color: Colors.black,
);

/////////////////////////////////////////////////////////////////

class CustomNavigationBarCart extends GetView<CratControllerImp> {
  final String price;
  final String discount;
  final String shaping;
  final String totalPrice; 
  final void Function()? onPressed;
  final void Function()? apply;
  final Key? formatKey;
  final TextEditingController? coponController;

  const CustomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shaping,
      required this.totalPrice, 
      required this.onPressed,
      required this.formatKey,
      required this.coponController,
      required this.apply,

      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CratControllerImp>(
            builder: (controller) => (controller.coponNamed == null)
                ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height:controller.whenWritten == true? 67 :40,
                        child: Form(
                          key: formatKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field must not be empty";
                              }
                              
                            },
                            controller: coponController,
                            decoration: InputDecoration(
                              hintText: "Enter your copon",
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        height: 37,
                        shape: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primaryColor),
                        ),
                        color: AppColors.primaryColor,
                        onPressed: apply,
                        child: Text(
                          "Apply",
                          style: Style.textStyle,
                        ),
                      ),
                    ),
                  ],
                )
                : SizedBox(
                  height: 25,
                  child: Text(
                    "Copon Code ${controller.coponModel!.coponName}",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.red),
            ),
            child: Column(
              children: [
                
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "price",
                      style: style,
                    ),
                    Text("$price \$"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "discount",
                      style: style,
                    ),
                    Text("$discount \$"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Shapping",
                      style: style,
                    ),
                    Text("$shaping \$"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "expair Date your copon",
                      style: style,
                    ),                  
                if (controller.expairedate !=null && controller.coponModel != null &&  controller.coponId == controller.coponModel!.coponId) 
                Text(Jiffy.parse('${controller.expairedate}').fromNow()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Total Price ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "$totalPrice \$",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: MaterialButton(
              height: 40,
              shape: const StadiumBorder(),
              color:AppColors.primaryColor,
              onPressed: onPressed,
              child: Text(
                "Order",
                style: Style.textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
