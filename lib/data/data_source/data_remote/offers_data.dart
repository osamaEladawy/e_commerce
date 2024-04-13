
import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/linkapi.dart';

class OffersData{
  Curd curd;

  OffersData({required this.curd});

  getData()async{
    var result = await curd.postRequest( ApiLink.offers, {});
    return result.fold((l) => l, (r) => r);
  }

  searchForData(String search)async{
    var result = await curd.postRequest( ApiLink.search, {
      "search" : search,
    });
    return result.fold((l) => l, (r) => r);
  }

}