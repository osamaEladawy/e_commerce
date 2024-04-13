import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pendingorder_controller.dart';
import '../../../core/constant/approutes.dart';
import '../../../data/model/pendingorders_model.dart';
TextStyle style = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);


class CustomListCard extends GetView<PendingOrdersControllerImp> {
  final PendingOrdersModel pendingOrdersModel;

  const CustomListCard({super.key, required this.pendingOrdersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Number : ${pendingOrdersModel.ordersId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
                const Spacer(),
                Text(Jiffy.parse('${pendingOrdersModel.ordersDatetime}').fromNow(),style:const TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            const Divider(),
            Text(
              'Order type : ${controller.printOrderType(pendingOrdersModel.ordersType!)} ',
              style: style,
            ),
            Text(
              'Order price : ${pendingOrdersModel.ordersPrice}\$',
              style: style,
            ),
            Text(
              'Order delivery : ${pendingOrdersModel.ordersPricedelivery}\$',
              style: style,
            ),
            Text(
              'Order payment : ${controller.printPaymentMethod(pendingOrdersModel.orderPaymentmethod!)}',
              style: style,
            ),
            Text(
              'Order Status : ${controller.printOrderStatus(pendingOrdersModel.ordersStatus!)}' ,
              style: style,
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Total price : ${pendingOrdersModel.ordersTotalprice}',
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                ),
               Expanded(
                 flex: 2,
                 child: ButtonBar(
                   children: [
                     if(pendingOrdersModel.ordersStatus == 0)
                     MaterialButton(
                       color: Colors.red.shade100,
                       child: Text(
                         "Delete",
                         style: style,
                       ),
                       onPressed: () {
                        controller.deleteOrders(pendingOrdersModel.ordersId!);
                       },
                     ),
                     if(pendingOrdersModel.ordersStatus == 3)
                       MaterialButton(
                         color: Colors.red.shade100,
                         child: Text(
                           "Tracking",
                           style: style,
                         ),
                         onPressed: () {
                           controller.goToTracking(pendingOrdersModel);
                         },
                       ),
                     MaterialButton(
                       color: Colors.red.shade100,
                       child: Text(
                         "Detiales",
                         style: style,
                       ),
                       onPressed: () {
                         Get.toNamed(AppRoutes.detialesOrders,arguments: {
                           "orderdetails":pendingOrdersModel,
                         });
                         //controller.goToDetiales();
                       },
                     ),
                   ],
                 ),
               )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
