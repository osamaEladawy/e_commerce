
import 'package:e_commerce_app/core/class/curd.dart';

import '../../../linkapi.dart';

class FavouriteData{
  Curd curd;
  FavouriteData({required this.curd});

  addFavouriteData(String userid,int itemid) async{
    var response = await curd.postRequest(ApiLink.addFav, {
      "userid":userid.toString(),
      "itemid":itemid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavouriteData(String userid,int itemid) async{
    var response = await curd.postRequest(ApiLink.removeFav, {
      "userid":userid.toString(),
      "itemid":itemid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}