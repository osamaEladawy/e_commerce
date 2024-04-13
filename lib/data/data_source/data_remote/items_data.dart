
import 'package:e_commerce_app/core/class/curd.dart';

import '../../../linkapi.dart';

class ItemsData{
 final Curd curd;

  ItemsData({required this.curd});

 getData(int categoryid,String? userid)async{
   var result = await curd.postRequest( ApiLink.items, {
     "id" :categoryid.toString(),
     "userid":userid.toString(),
   });
   return result.fold((l) => l, (r) => r);
 }

 searchForData(String search)async{
   var result = await curd.postRequest( ApiLink.search, {
     "search" : search,
   });
   return result.fold((l) => l, (r) => r);
 }


}