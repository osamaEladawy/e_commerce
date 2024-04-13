import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/approutes.dart';
import '../../core/functions/handleStatus_response.dart';
import '../../data/model/items_model.dart';

abstract class ItemsController extends GetxController{
changeCat(int index , int value);
getItems(int categoryid);
gotoProductDetiales(ItemsModel productDetails);
goToFavourite();
goToNotification();
checkSearch(String value);
search();
listOfProducts();


}

class ItemsControllerImp extends ItemsController{
  List categories = [];
  List data = [];
  late int valueCat;
  late TextEditingController searchController;
  GlobalKey<FormState>formState = GlobalKey<FormState>();

  int? selected;
  late int categoryid ;
  ItemsData itemsData   = ItemsData(curd:Get.find());
  MyServices services = Get.find();
  StatusRequest statusRequest  = StatusRequest.none;
  List<ItemsModel> listOfModel = [];
  bool isSearch = false;



  @override
  void onInit() {
   initialData();
    super.onInit();
  }


  initialData(){
    categories = Get.arguments['categories'];
    selected = Get.arguments['selectedcat'] ;
    categoryid = Get.arguments['categoryid'];
    searchController = TextEditingController();
    getItems(categoryid);
  }


  //////////


  @override
  changeCat(index,value) {
    selected = index;
    valueCat = value;
    getItems(valueCat);
    update();
  }

  ///////////


  @override
  getItems(categoryid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid,services.preferences!.getString("id"));
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  /////////////
  @override
  checkSearch(value) {
    if(value.isEmpty){
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  @override
  search() {
    if(formState.currentState!.validate()){
      isSearch = true;
      listOfProducts();
    }else{
      print("not valid");
    }
    update();
  }


  @override
  gotoProductDetiales(productDetails) {
    Get.toNamed(AppRoutes.productDetiales,arguments: {
      "productdetails" : productDetails,
    });
  }

  @override
  goToFavourite() {
   Get.toNamed(AppRoutes.myFavourite);
  }

  @override
  listOfProducts() async{
    statusRequest = StatusRequest.loading;
    update();
    var response= await itemsData.searchForData(searchController.text);
    print("response controller....................................$response");
    statusRequest = handleStatus(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "success"){
        listOfModel.clear();
        List data = response['data'];
        listOfModel.addAll(data.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
@override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  goToNotification() {
 Get.toNamed(AppRoutes.notification);
  }

}