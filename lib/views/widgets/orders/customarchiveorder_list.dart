import 'package:e_commerce_app/views/widgets/orders/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archiveorder_controller.dart';
import '../../../data/model/pendingorders_model.dart';

TextStyle style = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);


class CustomListCardArchive extends GetView<ArchiveOrdersControllerImp> {
  final PendingOrdersModel pendingOrdersModel;

  const CustomListCardArchive({super.key, required this.pendingOrdersModel});

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
                if(pendingOrdersModel.ordersRating == 0)
                MaterialButton(
                  color: Colors.red.shade100,
                  child: Text(
                    "Rating",
                    style: style,
                  ),
                  onPressed: () {
                  showDialogRating(context,pendingOrdersModel.ordersId!);
                  },
                ),
                const SizedBox(width: 10,),
                MaterialButton(
                  color: Colors.red.shade100,
                  child: Text(
                    "Detiales",
                    style: style,
                  ),
                  onPressed: () {
                   controller.goToProductDetiales(pendingOrdersModel);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
