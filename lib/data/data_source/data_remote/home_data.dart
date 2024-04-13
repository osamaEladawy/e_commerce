import '../../../core/class/curd.dart';
import '../../../linkapi.dart';

class HomaPageData {
  Curd curd;

  HomaPageData({required this.curd});

  getData()async{
    var result = await curd.postRequest( ApiLink.home, {});
    return result.fold((l) => l, (r) => r);
  }

    offers()async{
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