import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address/view_address_controller.dart';
import '../../core/class/handlingdata_view.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressControllerImp controllerImp = Get.put(ViewAddressControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          controllerImp.goToAddAdrees();
        },
      ),
      appBar: AppBar(
        title: const Text("Locations"),
      ),
      body: GetBuilder<ViewAddressControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardAddress(
                  onPressed: (){
                    controller.deleteData(controller.data[index].addressId!);
                  },
                  addressModel: controller.data[index],);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressed;
  const CardAddress({super.key, required this.addressModel,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:  Text("${addressModel.addressName}"),
        subtitle:  Text("${addressModel.addressCity} ${addressModel.addressStreet}"),
        trailing:IconButton(onPressed: onPressed,icon: const Icon(Icons.location_on_outlined),),
      ),
    );
  }
}

