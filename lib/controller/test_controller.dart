import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handleStatus_response.dart';
import '../data/data_source/data_remote/test_data.dart';


//this class  handles data from server and provides ui by information,


class TextController extends GetxController{
  //if i want inistance from Curd,to get fuction
  // 1-create inistance into class,
  // 2-create initiaal bidding,this is best away
  TestData testData  = TestData(curd:Get.find(),);

  //create list to save the data,
 List data = [];

 //create inistane from status request,to give initial operation inital status,
late StatusRequest statusRequest;

//create function to get data,
getData()async{
  //initial status
  statusRequest = StatusRequest.loading;
  //fetch data
  var response = await testData.getData();
  //check for data, it is map || status request,
  statusRequest = handleStatus(response);
  /*
  If the result from the server is equal to the result in my class,
  which means the operation is successful,return the data to the map
  */
  if(StatusRequest.success == statusRequest){
    //check for operation is successful,
   if(response["status"] == "success"){
     data.addAll(response['data']);
   }else{
     statusRequest = StatusRequest.failure;
   }
  }
  update();

}

@override
  void onInit() {
    getData();
    super.onInit();
  }

}